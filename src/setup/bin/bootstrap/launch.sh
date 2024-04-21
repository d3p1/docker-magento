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

##
# Main
# 
# @param  string $1 Environment key
# @return void
##
main() {
    ##
    # @note Execute script that launches environment
    ##
    execute_script "$BASE_DIR/bootstrap/$1/launch.sh"

    ##
    # @todo Remove init profile and execute init commands here
    ##

    ##
    # @note Return with success
    ##
    return 0
}

##
# Init DB
#
# @return void
##
_init_db() {
    _normalize_db_dump "$MAGENTO_DB_DUMP_PATH"
    mysql \
    -u"$MAGENTO_DB_USER" \
    -p"$MAGENTO_DB_PASSWORD" \
    -h"$MAGENTO_DB_HOST" \
    "$MAGENTO_DB_NAME" \
    < "$MAGENTO_DB_DUMP_PATH" 
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
# @note Call main
##
main "$@"