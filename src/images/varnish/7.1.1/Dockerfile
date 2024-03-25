##
# @description Varnish (v7.1.1) image for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use official Magento Cloud image
# @note Add healthcheck
# @link https://hub.docker.com/r/magento/magento-cloud-docker-varnish
# @link https://github.com/magento/magento-cloud-docker/blob/develop/images/varnish/7.1.1/Dockerfile
# @link https://hub.docker.com/_/varnish
##
FROM magento/magento-cloud-docker-varnish:7.1-1.4.0
    ##
    # @note Switch to `root` user 
    #       to be able to install cURL needed for healtcheck command
    ##
    USER root
    RUN set -e; \
        apt-get update; \
        apt-get -y install curl

    ##
    # @note Switch to `varnish` user
    ##
    USER varnish

    ##
    # @note Set default value to Varnish HTTP port environment variable
    ##
    ENV VARNISH_HTTP_PORT="80"
    
    ##
    # @note Add healthcheck command
    ##
    HEALTHCHECK --interval=5s --timeout=5s \
                CMD curl --fail 127.0.0.1:"$VARNISH_HTTP_PORT"
    