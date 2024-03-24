##
# @description PHP-FPM (v8.2) image for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use official Magento Cloud image
# @note Add healthcheck
# @link https://hub.docker.com/r/magento/magento-cloud-docker-php
# @link https://github.com/magento/magento-cloud-docker/blob/develop/images/php/fpm/Dockerfile
# @link https://github.com/renatomefi/php-fpm-healthcheck
##
FROM magento/magento-cloud-docker-php:8.2-fpm-1.4.0
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
    