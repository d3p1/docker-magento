##
# @description PHP-FPM (v7.3) image (with development purpose) 
#              for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @note        The main porpouse of this image is to implement 
#              a PHP-FPM container for development porpouse.
#              The official PHP-FPM image already includes PHP CLI, 
#              but Composer has been added as a primary tool for managing
#              code dependencies. Also, Xdebug has been installed 
#              for debugging purpose (the web server can be configured to 
#              redirect requests to the container with this image, 
#              allowing for analysis with Xdebug).
#              In this way, it is possible to connect to the container with
#              this image and work with an already implemented development
#              environment (i.e.: using Dev Container)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use respective PHP-FPM image as base image
# @note Add Composer so this image could be used for development purpose
# @note Add Xdebug for debugging purpose
# @note Update the ownership of the working directory to `www:www` 
#       so that it can be accessed by the host user. 
#       Please note that the container user (`www:www` in this case) 
#       with `UID:GID` `1000:1000` will match the `UID:GID` of the host user
# @link https://hub.docker.com/r/d3p1/magento-php
##
FROM d3p1/magento-php:7.3-fpm
     ##
     # @note It seems that `ARG` variables like `MAGENTO_ROOT` 
     #       are not inherited from base images, 
     #       so it is necessary to define them again
     # @link https://github.com/magento/magento-cloud-docker/blob/9998e5615a37cc584ac26b236104ae040aa6e0c5/images/php/fpm/Dockerfile#L15
     ##
     ARG MAGENTO_ROOT="/app"

     ##
     # @note Update working directory ownership to `www:www` so it can
     #       be accessed by the host user (`1000:1000`)
     # @note Magento official image already set the ownership of
     #       the working directory to `www:www`, 
     #       but it appears that the update is not taking effect 
     #       and the ownership of this directory still remains as `root:root` 
     # @link https://github.com/magento/magento-cloud-docker/blob/9998e5615a37cc584ac26b236104ae040aa6e0c5/images/php/fpm/Dockerfile#L64
     ##
     RUN chown -R www:www ${MAGENTO_ROOT}

     ##
     # @note Add Composer
     # @link https://github.com/magento/magento-cloud-docker/blob/9998e5615a37cc584ac26b236104ae040aa6e0c5/images/php/cli/Dockerfile#L21
     ##
     ENV COMPOSER_MEMORY_LIMIT=-1
     ENV COMPOSER_ALLOW_SUPERUSER=1
     ENV COMPOSER_HOME="/composer"
     COPY --from=d3p1/magento-php:7.3-cli \
          /usr/local/bin/composer \
          /usr/local/bin/composer
     RUN mkdir ${COMPOSER_HOME}
     RUN chown -R www:www ${COMPOSER_HOME}

     ##
     # @note Add Xdebug as current enabled extensions
     # @link https://github.com/magento/magento-cloud-docker/blob/9998e5615a37cc584ac26b236104ae040aa6e0c5/images/php/fpm/docker-entrypoint.sh#L13
     ##
     ENV PHP_EXTENSIONS="bcmath bz2 calendar exif gd gettext intl mysqli opcache pdo_mysql redis soap sockets sodium sysvmsg sysvsem sysvshm xsl zip pcntl xdebug"

     ##
     # @note Add custom entrypoint to include startup logic
     # @link https://github.com/magento/magento-cloud-docker/blob/9998e5615a37cc584ac26b236104ae040aa6e0c5/images/php/fpm/Dockerfile#L72
     ##
     COPY main.docker-entrypoint.sh /
     RUN chmod +x /main.docker-entrypoint.sh
     ENTRYPOINT ["/main.docker-entrypoint.sh"]
     CMD ["php-fpm", "-R"]