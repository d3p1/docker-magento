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
        # @note Download in `/tmp` folder and return to current location (`cd -`)
        # @link https://stackoverflow.com/questions/16362402/save-file-to-specific-folder-with-curl-command
        ##
        cd /tmp                                                         && \
        curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
        chmod +x mkcert-v*-linux-amd64                                  && \
        sudo cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert             && \
        cd - || exit 1
    fi    
}

##
# @note Call main
##
main "$@"