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
# @link   https://docs.docker.com/engine/install/debian/
# @todo   Analyze to move this function to an utility script where it will be
#         possible to implement a cleaner logic
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
        # @note Install and configure `docker` repository
        ##
        sudo apt-get update
        sudo apt-get install \
            ca-certificates \
            curl \
            gnupg
        sudo mkdir -m 0755 -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/debian/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) \
        signed-by=/etc/apt/keyrings/docker.gpg] \
        https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        ##
        # @note Install `docker`, `docker compose` and additional required tools
        ##
        sudo apt-get update
        sudo apt-get install \
            docker-ce \
            docker-ce-cli \
            containerd.io \
            docker-buildx-plugin \
            docker-compose-plugin
    fi
}

##
# @note Call main
##
main "$@"