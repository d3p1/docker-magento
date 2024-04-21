#!/bin/bash

##
# @description Install development dependencies
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
source $BASE_DIR/utility/mkcert/install.sh

##
# Main
# 
# @return void
##
main() {
    ##
    # @note Install `mkcert` to generate locally-trusted SSL certificates
    ##
    _install_mkcert

    ##
    # @note Return with success
    ##
    return 0
}

##
# Install `mkcert` tool
#
# @return void
# @link   https://github.com/FiloSottile/mkcert
##
_install_mkcert() {
    ##
    # @note Check if `mkcert` is already installed
    ##
    if [ -z "$(which mkcert)" ]; then
        ##
        # @note Notify `mkcert` installation
        ##
        echo "Installing mkcert tool..."

        ##
        # @note Install `mkcert`
        ##
        install_mkcert
    fi    
}

##
# @note Call main
##
main "$@"