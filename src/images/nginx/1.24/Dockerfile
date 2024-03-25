##
# @description Nginx (v1.24) image for a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @link        https://github.com/d3p1/docker-magento
##

##
# @note Use official Magento Cloud image
# @note Add healthcheck using as reference the excellent implementation in
#       `markshust/docker-magento` project
# @link https://hub.docker.com/r/magento/magento-cloud-docker-nginx
# @link https://github.com/magento/magento-cloud-docker/blob/develop/images/nginx/1.24/Dockerfile
# @link https://github.com/markshust/docker-magento/blob/master/compose/compose.healthcheck.yaml#L5
##
FROM magento/magento-cloud-docker-nginx:1.24-1.3.6
    ##
    # @note It is used a 5 minutes delay in the healthcheck (`--start-period`) 
    #       just in case it is necessary to wait for some 
    #       Magento install/upgrade/initialization bootstrap logic
    ##
    HEALTHCHECK --interval=5s --timeout=5s --start-period=3000s \
                CMD curl --fail 127.0.0.1:"$UPSTREAM_PORT"
    