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
source $BASE_DIR/lib/mysql/normalize-dump.sh

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
    # @note Launch project.
    #       Init platform. Install/Reinstall a Magento project if needed
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
    local is_install
    local is_reinstall
    local is_cron_service_started
    local magento_version
    local dump_path

    ##
    # @note Launch Docker Compose
    ##
    docker compose up -d --build

    ##
    # @note Evaluate if it is required to execute the installation of a 
    #       Magento project (it is used Composer installation process)
    # @note Evaluate if it is needed to reinstall a Magento project
    #       (it is migrate a Magento dump and it is updated the
    #        Magento configuration so it used current
    #        Docker Compose tech stack)
    # @link https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/composer
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/images/php/8.2-cli/bin/init#L28
    # @link https://github.com/d3p1/docker-magento/blob/fbd61e3da89bc5cb1d2027ae977261f22e19ec06/src/images/php/8.2-cli/Dockerfile#L31
    ##
    echo "Would you like to install a new Magento project? y(es) or n(o)"
    read -r is_install
    if [ "$is_install" = "y" ]; then
        echo "What Magento version would you like to install?"
        read -r magento_version
        BASE_MAGENTO_VERSION="$magento_version"
        export BASE_MAGENTO_VERSION

        docker compose run cli init 0
    else
        echo "Would you like to reinstall a Magento project? y(es) or n(o)"
        read -r is_reinstall

        if [ "$is_reinstall" = "y" ]; then
            echo "Introduce the dump path:"
            read -r dump_path    
            _init_db "$dump_path"

            docker compose run cli init 1
        fi
    fi

    ##
    # @note Evaluate if it is needed to start cron service
    ##
    echo "Would you like to start Magento cron service? y(es) or n(o)"
    read -r is_cron_service_started
    if [ "$is_cron_service_started" = "y" ]; then
        docker compose start cron
    fi

    ##
    # @note Generate infra files so it is possible to continue using the
    #       defined environment configuration
    ##
    _generate_infra_files
}

##
# Generate infra files
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
    #       defined environment variables during this setup script
    ##
    find ./services -f -name ".env" -exec bash -c 'envsubst_file "$1"' _ {} \;

    ##
    # @note Remove unneeded Traefik `.gitignore` file
    ##
    rm ./services/traefik/.gitignore
}

##
# Init DB
#
# @param  string $1 DB dump path
# @return void
##
_init_db() {
    ##
    # @note It is normalized DB dump to avoid user permission errors
    # @link https://github.com/markshust/docker-magento?tab=readme-ov-file#database
    ##
    normalize_db_dump "$1"

    ##
    # @note The DB dump is copied to the DB service to be able to migrate it
    #       using service commands
    # @note It is executed the DB dump migration command within a new 
    #       container shell to be able to use container environment variables
    # @link https://superuser.com/questions/1628497/docker-exec-with-dollar-variable
    ##
    docker compose cp "$1" mariadb:/tmp/db.sql
    docker compose exec mariadb sh -c \
    'mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /tmp/db.sql' 
}

##
# @note Call main
##
main "$@"