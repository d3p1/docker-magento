##
# @description PHP-FPM (v8.1) image for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use official Magento Cloud image
# @note Add healthcheck
# @note Set the ownership of the working directory to `www`
#       to enable working with it using the host user
# @link https://hub.docker.com/r/magento/magento-cloud-docker-php
# @link https://github.com/magento/magento-cloud-docker/blob/develop/images/php/fpm/Dockerfile
# @link https://github.com/renatomefi/php-fpm-healthcheck
##
FROM magento/magento-cloud-docker-php:8.1-fpm-1.3.7
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
    # @note It is installed the script that performs the healthckeck
    #       with its required dependency (`fcgi`)
    # @link https://github.com/renatomefi/php-fpm-healthcheck/tree/v0.5.0
    #
    ##
    COPY bin/php-fpm-healthcheck.sh /usr/local/bin/
    RUN chmod +x /usr/local/bin/php-fpm-healthcheck.sh
    RUN set -x && \
        apt-get update && \
        apt-get install -y libfcgi-bin
    
    ##
    # @note It is required to enable the PHP-FPM status page
    #       to be able to execute the healthcheck script
    # @link https://github.com/renatomefi/php-fpm-healthcheck/blob/v0.5.0/test/Dockerfile-buster
    ##
    RUN set -xe && echo "pm.status_path = /status" \
        >> /usr/local/etc/php-fpm.d/zz-docker.conf
    
    ##
    # @note Add healthcheck
    # @link https://github.com/renatomefi/php-fpm-healthcheck?tab=readme-ov-file#docker-example
    ##
    HEALTHCHECK --interval=5s --timeout=1s CMD php-fpm-healthcheck.sh || exit 1
    