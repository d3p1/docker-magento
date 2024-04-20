#!/bin/bash

##
# @description Install environment dependencies
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
source $BASE_DIR/utility/install-docker.sh

##
# Main
# 
# @param  string $1 Environment key
# @return void
##
main() {
    ##
    # @note Install `docker` (it is required by both environments)
    ##
    _install_docker

    ##
    # @note Execute script that installs dependencies required by environment
    ##
    execute_script "$BASE_DIR/bootstrap/$1/install-dependencies.sh"

    ##
    # @note Return with success
    ##
    return 0
}

##
# Install `docker`
#
# @return void
##
_install_docker() {
    ##
    # @note Check if `docker` is already installed
    ##
    if [ -z "$(which docker)" ]; then
        ##
        # @note Notify `docker` installation
        ##
        echo "Installing Docker tools..."

        ##
        # @note Install `docker`
        ##
        install_docker
    fi
}

##
# @note Call main
##
main "$@"