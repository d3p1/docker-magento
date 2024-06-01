#!/bin/bash

##
# @description Configure host machine
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
source $BASE_DIR/lib/get-resources.sh

##
# Main
# 
# @param  string $1 Environment key
# @return void
##
main() {
    ##
    # @note Configure Magento static content deploy jobs 
    #       (it is required by both environments)
    ##
    _configure_magento_static_content_deploy_jobs

    ##
    # @note Execute script that configures host considering 
    #       respective environment
    ##
    execute_script "$BASE_DIR/dockgento/$1/configure-host.sh"

    ##
    # @note Return with success
    ##
    return 0
}

##
# Configure Magento static content deploy jobs
#
# @return void
##
_configure_magento_static_content_deploy_jobs() {
    SCRIPT_MAGENTO_STATIC_CONTENT_DEPLOY_JOBS=get_number_cpus
    export SCRIPT_MAGENTO_STATIC_CONTENT_DEPLOY_JOBS
}

##
# @note Call main
##
main "$@"