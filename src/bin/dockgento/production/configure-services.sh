#!/bin/bash

##
# @description Configure services for production environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Add flag to exit script if there is an error related to a command
#       or if it is used an undefined variable
##
set -eu

##
# Main
# 
# @return void
##
main() {
    ##
    # @note Init production environment. Setup required environment variables
    ##
    _init_prod_env

    ##
    # @note Return with success
    ##
    return 0
}

##
# Init production environment
#
# @return void
##
_init_prod_env() {
    ##
    # @note Disable Xdebug host in `web` service
    # @note Init Magento in production mode
    # @link https://github.com/magento/magento-cloud-docker/blob/414e4647902642560a83db8b9ee88541bf6d400e/images/nginx/1.24/docker-entrypoint.sh#L20
    # @link https://github.com/d3p1/docker-magento/blob/6cd8c58f3dee7eac2d60fca517acf2de82c22ad9/src/setup/services/web/.env#L22
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/images/php/8.2-cli/bin/deploy#L36
    ##
    SCRIPT_WITH_XDEBUG="0"
    SCRIPT_MAGENTO_RUN_MODE="production"
    export SCRIPT_WITH_XDEBUG
    export SCRIPT_MAGENTO_RUN_MODE

    ##
    # @note Enable Docker Compose in production mode 
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/setup/.env#L85
    ##
    SCRIPT_COMPOSE_FILE="docker-compose.yml:docker-compose.prod.yml:services/search/${SCRIPT_SEARCH_SERVICE}/docker-compose.yml"
    export SCRIPT_COMPOSE_FILE
}

##
# @note Call main
##
main "$@"