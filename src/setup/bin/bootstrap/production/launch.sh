#!/bin/bash

##
# @description Launch production environment
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
    echo "Launch production environment"

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
    # @note Init Magento in production mode
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/images/php/8.2-cli/bin/deploy#L36
    ##
    BASE_MAGENTO_RUN_MODE="production"
    export BASE_MAGENTO_RUN_MODE

    ##
    # @note Enable Docker Compose in production mode 
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/setup/.env#L85
    ##
    COMPOSE_FILE="docker-compose.yml:docker-compose.prod.yml:services/search/${BASE_SEARCH_SERVICE}/docker-compose.yml"
    export COMPOSE_FILE

    ##
    # @note Enable Docker Compose profiles (enable `cron` service) 
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/setup/docker-compose.yml#L96
    # @link https://docs.docker.com/compose/environment-variables/envvars/#compose_profiles
    ##
    COMPOSE_PROFILES="cron"
    export COMPOSE_PROFILES
}

##
# @note Call main
##
main "$@"