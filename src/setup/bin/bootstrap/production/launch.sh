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
    # @note Return with success
    ##
    return 0
}

##
# @note Call main
##
main "$@"