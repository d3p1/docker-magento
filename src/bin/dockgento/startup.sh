#!/bin/bash

##
# @description Startup (configure/start services in launched environment)
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Add flag to exit script if there is an error related to a command
#       or if it is used an undefined variable
##
set -eu

source $BASE_DIR/lib/mysql/normalize-dump.sh

##
# Main
# 
# @return void
##
main() {
    local is_install
    local is_reinstall
    local is_cron_service_started

    ##
    # @note Evaluate if it is required to execute the installation of a 
    #       Magento project (it is used Composer installation process)
    # @note Evaluate if it is needed to reinstall a Magento project
    #       (it is migrated a Magento dump and it is updated the
    #        Magento configuration so it uses current
    #        Docker Compose tech stack)
    # @link https://experienceleague.adobe.com/en/docs/commerce-operations/installation-guide/composer
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/images/php/8.2-cli/bin/init#L28
    # @link https://github.com/d3p1/docker-magento/blob/fbd61e3da89bc5cb1d2027ae977261f22e19ec06/src/images/php/8.2-cli/Dockerfile#L31
    ##
    echo "Would you like to install a new Magento project? y(es) or n(o)"
    read -r is_install
    if [ "$is_install" = "y" ]; then
        _install_platform
    else
        echo "Would you like to reinstall a Magento project? y(es) or n(o)"
        read -r is_reinstall
        if [ "$is_reinstall" = "y" ]; then
            _reinstall_platform
        fi
    fi

    ##
    # @note Evaluate if it is needed to start the cron service
    ##
    echo "Would you like to start Magento cron service? y(es) or n(o)"
    read -r is_cron_service_started
    if [ "$is_cron_service_started" = "y" ]; then
        docker compose up cron
    fi

    ##
    # @note Return with success
    ##
    return 0
}

##
# Install platform
#
# @return void
# @note   It is used `docker compose run cli` instead of `docker compose up cli`
#         to be able to define command to run (it is not possible to do that
#         using `docker compose up <service>`)
##
_install_platform() {
    local magento_version
    echo "What Magento version would you like to install?"
    read -r magento_version
    SCRIPT_MAGENTO_VERSION="$magento_version"
    export SCRIPT_MAGENTO_VERSION
    docker compose run --rm cli init 0
}

##
# Reinstall platform
#
# @return void
# @note   It is used `docker compose run cli` instead of `docker compose up cli`
#         to be able to define command to run (it is not possible to do that
#         using `docker compose up <service>`)
##
_reinstall_platform() {
    local dump_path
    echo "Introduce the dump path:"
    read -r dump_path    
    _init_db "$dump_path"
    docker compose run --rm cli init 1
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