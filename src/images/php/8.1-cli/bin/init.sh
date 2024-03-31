#!/bin/sh

##
# @description Init a Magento 2 platform
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# 
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
    # @note Install Magento
    ##
    install.sh

    ##
    # @note Deploy Magento
    ##
    deploy.sh

    ##
    # @note Change ownership to 1000:1000 account to be able to work 
    #       with source code on the host
    # @link https://github.com/magento/magento-cloud-docker/blob/develop/images/php/cli/Dockerfile#L75
    # @link https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user
    ##
    chown -R www:www .

    ##
    # @note Return with success
    ##
    return 0;
}

##
# @note Install and deploy Magento
##
main "$@"