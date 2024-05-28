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
source $BASE_DIR/lib/execute-script.sh
source $BASE_DIR/lib/execute-menu.sh
source $BASE_DIR/lib/envsubst-file.sh

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
    # @note Execute script that launches environment
    ##
    execute_script "$BASE_DIR/bootstrap/$1/launch.sh"

    ##
    # @note Launch project
    ##
    _launch

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
    BASE_URL="$domain"
    export BASE_URL 
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
    #       (it requires it to generate the SSL certificates using this email)
    #       
    ##
    BASE_USER_EMAIL="$email"
    export BASE_USER_EMAIL
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
    BASE_COMPOSER_MAGENTO_USERNAME="$username"
    BASE_COMPOSER_MAGENTO_PASSWORD="$password"
    export BASE_COMPOSER_MAGENTO_USERNAME
    export BASE_COMPOSER_MAGENTO_PASSWORD
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
    BASE_PHP_VERSION="$php_version"
    export BASE_PHP_VERSION
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
    BASE_MARIADB_VERSION="$mariadb_version"
    export BASE_MARIADB_VERSION
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
    BASE_SEARCH_SERVICE=$search_engine
    export BASE_SEARCH_SERVICE
    case $search_engine in
        "elasticsearch")
            BASE_MAGENTO_SEARCH_ENGINE_HOST="elasticsearch"
            BASE_MAGENTO_SEARCH_ENGINE_PORT="9200"
            MAGENTO_SEARCH_ENGINE="elasticsearch7"
            ;;
        "opensearch")
            BASE_MAGENTO_SEARCH_ENGINE_HOST="opensearch"
            BASE_MAGENTO_SEARCH_ENGINE_PORT="9200"
            MAGENTO_SEARCH_ENGINE="opensearch"
            ;;
    esac
    export BASE_MAGENTO_SEARCH_ENGINE_HOST 
    export BASE_MAGENTO_SEARCH_ENGINE_PORT 
    export MAGENTO_SEARCH_ENGINE 
}

##
# Launch
#
# @return void
##
_launch() {
    ##
    # @note Generate infra files so it is possible to continue using the
    #       defined environment configuration
    ##
    _generate_infra_files

    ##
    # @note Launch Docker Compose
    ##
    docker compose up -d --build
}

##
# Generate infra files in current directory where this script was executed
#
# @return void
# @todo   Improve copy logic
##
_generate_infra_files() {
    ##
    # @note Copy required infra files inside current folder
    ##
    cp "$BASE_DIR/../.env" .env
    cp "$BASE_DIR/../docker-compose.dev.yml" docker-compose.dev.yml
    cp "$BASE_DIR/../docker-compose.prod.yml" docker-compose.prod.yml
    cp "$BASE_DIR/../docker-compose.yml" docker-compose.yml
    cp -R "$BASE_DIR/../.devcontainer" ./.devcontainer
    cp -R "$BASE_DIR/../services" ./services
    
    ##
    # @note Replace environment variables inside `.env` files with
    #       defined environment variables during this script
    # @note It is required to export the `envsubst_file` function because
    #       the subshell executed by `find` won't be able to access 
    #       this function
    # @link https://stackoverflow.com/questions/4321456/find-exec-a-shell-function-in-linux
    ##
    export -f envsubst_file
    find ./services -type f -name ".env" -exec bash -c 'envsubst_file "$0"' {} \;

    ##
    # @note Remove unneeded Traefik `.gitignore` file
    ##
    rm ./services/traefik/.gitignore
}

##
# @note Call main
##
main "$@"