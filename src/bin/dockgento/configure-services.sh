#!/bin/bash

##
# @description Configure services
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
source $BASE_DIR/lib/execute-script.sh
source $BASE_DIR/lib/execute-menu.sh

##
# Main
# 
# @param  string $1 Environment key
# @return void
##
main() {
    ##
    # @note Configure platform domain
    ##
    _configure_domain

    ##
    # @note Configure email address required to create Magento admin user
    #       (and to generate SSL certificates)
    ##
    _configure_email_address

    ##
    # @note Configure Composer credentials required to install/reinstall/update
    #       Magento packages
    ##
    _configure_composer_magento_credentials

    ##
    # @note Configure the PHP version that will be used 
    #       by the Magento platform
    ##
    _configure_php

    ##
    # @note Configure the MariaDB version that will be used 
    #       by the Magento platform
    ##
    _configure_mariadb

    ##
    # @note Configure the search engine that will be used 
    #       by the Magento platform
    ##
    _configure_search_engine

    ##
    # @note Execute script that configure services by environment
    ##
    execute_script "$BASE_DIR/dockgento/$1/configure-services.sh"

    ##
    # @note Return with success
    ##
    return 0
}

##
# Configure domain
#
# @return void
##
_configure_domain() {
    local domain

    ##
    # @note Get domain
    ##
    echo "Domain:"
    read -r domain

    ##
    # @note Export environment variable required for 
    #       our Docker Compose `web` service (the Magento platform requires
    #       it to set the base URLs)
    ##
    SCRIPT_BASE_URL="$domain"
    export SCRIPT_BASE_URL 
}

##
# Configure email address
#
# @return void
##
_configure_email_address() {
    local email

    ##
    # @note Get email
    ##
    echo "Email"
    read -r email

    ##
    # @note Export environment variable required for 
    #       our Docker Compose `web` service (the Magento platform requires
    #       it to set the admin user email address) and `traefik` service
    #       (Traefik requires it to generate the 
    #        SSL certificates using this email)
    #       
    ##
    SCRIPT_BASE_USER_EMAIL="$email"
    export SCRIPT_BASE_USER_EMAIL
}

##
# Configure Composer Magento credentials
#
# @return void
##
_configure_composer_magento_credentials() {
    local username
    local password

    ##
    # @note Get credentials
    ##
    echo "Composer Magento username:"
    read -r username
    echo "Composer Magento password:"
    read -r password

    ##
    # @note Export environment variable required for 
    #       our Docker Compose `cli` service (the Magento platform requires
    #       it to download platform packages)
    ##
    SCRIPT_COMPOSER_MAGENTO_USERNAME="$username"
    SCRIPT_COMPOSER_MAGENTO_PASSWORD="$password"
    export SCRIPT_COMPOSER_MAGENTO_USERNAME
    export SCRIPT_COMPOSER_MAGENTO_PASSWORD
}

##
# Configure PHP
#
# @return void
##
_configure_php() {
    local php_version
    echo "What PHP version would you like to install?"
    read -r php_version
    SCRIPT_PHP_VERSION="$php_version"
    export SCRIPT_PHP_VERSION
}

##
# Configure MariaDB
#
# @return void
##
_configure_mariadb() {
    local mariadb_version
    echo "What MariaDB version would you like to install?"
    read -r mariadb_version
    SCRIPT_MARIADB_VERSION="$mariadb_version"
    export SCRIPT_MARIADB_VERSION
}

##
# Configure search engine
#
# @return void
##
_configure_search_engine() {
    local search_engine

    ##
    # @note Get search engine
    ##
    search_engine=$(execute_menu \
                    "Search engine: " \
                    "OpenSearch" \
                    "Elasticsearch")

    ##
    # @note Evaluate search engine and export environment variables
    #       required for Docker Compose `web` service (the Magento platform
    #       requires it to set the project search engine). Also,
    #       it is used to define the Docker Compose configuration files used
    #       to setup the environment
    # @link https://github.com/d3p1/docker-magento/tree/756728d9dfb52318c64de923c500a027150ca38e/src/setup/services/search
    ##
    SCRIPT_SEARCH_SERVICE=$search_engine
    export SCRIPT_SEARCH_SERVICE
    case $search_engine in
        "elasticsearch")
            SCRIPT_MAGENTO_SEARCH_ENGINE_HOST="elasticsearch"
            SCRIPT_MAGENTO_SEARCH_ENGINE_PORT="9200"
            SCRIPT_MAGENTO_SEARCH_ENGINE="elasticsearch7"
            ;;
        "opensearch")
            SCRIPT_MAGENTO_SEARCH_ENGINE_HOST="opensearch"
            SCRIPT_MAGENTO_SEARCH_ENGINE_PORT="9200"
            SCRIPT_MAGENTO_SEARCH_ENGINE="opensearch"
            ;;
    esac
    export SCRIPT_MAGENTO_SEARCH_ENGINE_HOST 
    export SCRIPT_MAGENTO_SEARCH_ENGINE_PORT 
    export SCRIPT_MAGENTO_SEARCH_ENGINE 
}

##
# @note Call main
##
main "$@"