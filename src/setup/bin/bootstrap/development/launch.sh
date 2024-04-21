#!/bin/bash

##
# @description Launch development environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Install Docker
# @note Install mkcert
# @note Ask platform URL
# @note Update hosts files
# @note Prepare SSL
# @note Update Magento URL variables
# @note Ask search engine
# @note Configure search engine
# @note Ask to init new environment or to create an environment for project
# @note For existing project, ask for DB dump and remove `DEFINER`
# @note Init environment
# @note Deploy DB
# @note Fot existing project, configure with `config:set` and other methods 
#       search engine, varnish, redis
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
    echo "Launch development environment"

    ##
    # @note Return with success
    ##
    return 0
}

##
# Normalize DB dump
#
# @return void
# @link   https://github.com/markshust/docker-magento?tab=readme-ov-file#database
##
_normalize_db_dump() {
    sed 's/\sDEFINER=`[^`]*`@`[^`]*`//g' -i src/backup.sql
}

##
# Add domain to `/etc/hosts`
#
# @return void
# @link   https://github.com/markshust/docker-magento/blob/master/compose/bin/setup-domain
# @link   https://unix.stackexchange.com/questions/464652/is-there-any-difference-between-tee-and-when-using-echo
# @link   https://stackoverflow.com/questions/4749330/how-to-test-if-string-exists-in-file-with-bash
##
_add_domain_hosts() {
    if ! grep -q "$DOMAIN" /etc/hosts; then
        echo "Your system password is needed to add an entry to /etc/hosts..."
        echo "127.0.0.1 ::1 $DOMAIN" | sudo tee -a /etc/hosts
    fi
}

    ##
    # @note Export search service
    ##
    export BASE_SEARCH_SERVICE="elasticsearch"

##
# @note Call main
##
main "$@"