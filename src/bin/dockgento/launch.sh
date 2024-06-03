#!/bin/bash

##
# @description Launch environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Add flag to exit script if there is an error related to a command
#       or if it is used an undefined variable
##
set -eu

##
# @note Import required utilities
##
source $BASE_DIR/lib/envsubst-files.sh

##
# Main
# 
# @return void
##
main() {
    ##
    # @note Generate infra files so it is possible to continue using the
    #       defined environment configuration
    ##
    _generate_infra_files

    ##
    # @note Launch Docker Compose
    ##
    docker compose up -d --build

    ##
    # @note Return with success
    ##
    return 0
}

##
# Generate infra files in current directory where this script was executed
#
# @return void
##
_generate_infra_files() {
    ##
    # @note Copy required infra files inside current folder
    ##
    cp "$BASE_DIR/etc/.env" .env
    cp "$BASE_DIR/etc/docker-compose.dev.yml" docker-compose.dev.yml
    cp "$BASE_DIR/etc/docker-compose.prod.yml" docker-compose.prod.yml
    cp "$BASE_DIR/etc/docker-compose.yml" docker-compose.yml
    cp -R "$BASE_DIR/etc/.devcontainer" ./.devcontainer
    cp -R "$BASE_DIR/etc/services" ./services
    
    ##
    # @note Replace environment variables inside `.env` files with
    #       defined environment variables during this script
    ##
    envsubst_files ".env" '${SCRIPT_DOCKER_PATH},${SCRIPT_BASE_USER_EMAIL},${SCRIPT_BASE_URL},${SCRIPT_MARIADB_VERSION},${SCRIPT_DEV_DOC_ROOT_DIR},${SCRIPT_PHP_VERSION},${SCRIPT_SEARCH_SERVICE},${SCRIPT_COMPOSE_FILE},${SCRIPT_COMPOSER_MAGENTO_USERNAME},${SCRIPT_COMPOSER_MAGENTO_PASSWORD},${SCRIPT_MAGENTO_VERSION},${SCRIPT_MAGENTO_RUN_MODE},${SCRIPT_MAGENTO_STATIC_CONTENT_DEPLOY},${SCRIPT_MAGENTO_SEARCH_ENGINE},${SCRIPT_MAGENTO_SEARCH_ENGINE_HOST},${SCRIPT_MAGENTO_SEARCH_ENGINE_PORT},${SCRIPT_BASE_WITH_XDEBUG}'
}

##
# @note Call main
##
main "$@"