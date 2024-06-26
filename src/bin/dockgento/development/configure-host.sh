#!/bin/bash

##
# @description Configure development host machine
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
source $BASE_DIR/lib/docker/configure.sh

##
# Main
#
# @return void
##
main() {
    ##
    # @note Configure Docker
    ##
    _configure_docker

    ##
    # @note Return with success
    ##
    return 0;
}

##
# Configure Docker
#
# @return void
##
_configure_docker() {
    ##
    # @note Standard configuration of Docker
    ##
    echo "Configuring Docker..."
    configure_docker

    ##
    # @note Export environment variable required for 
    #       Docker Compose `traefik` service
    ##
    SCRIPT_DOCKER_PATH="/var/run/docker.sock"
    export SCRIPT_DOCKER_PATH
}

##
# @note Call main
##
main "$@"