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
source $BASE_DIR/utility/execute-script.sh

##
# Main
# 
# @param  string $1 Environment key
# @return void
##
main() {
    ##
    # @note Execute script that configures host considering 
    #       respective environment
    ##
    execute_script "$BASE_DIR/bootstrap/$1/configure-host.sh"

    ##
    # @note Return with success
    ##
    return 0
}

##
# @note Call main
##
main "$@"