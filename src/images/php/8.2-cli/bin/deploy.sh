#!/bin/sh

##
# @description Deploy Magento 2 platform
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
# @note        The Magento Cloud PHP CLI image already includes a script to 
#              deploy Magento, but it is believed that it may not work properly 
#              for this project
# @link        https://github.com/magento/magento-cloud-docker/blob/develop/images/php/cli/bin/cloud-deploy
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
    # @note Install packages
    ##
    if [ "$MAGENTO_RUN_MODE" = 'production' ]; then
        composer install
    else
        composer install --no-dev
    fi;

    ##
    # @note Set run mode
    ##
    bin/magento deploy:mode:set "$MAGENTO_RUN_MODE" --skip-compilation
    
    ##
    # @note Upgrade DB
    ##
    bin/magento setup:upgrade

    ##
    # @note Compile DI
    ##
    bin/magento setup:di:compile

    ##
    # @note Deploy static content
    ##
    bin/magento setup:static-content:deploy \
    -f \
    -s "$MAGENTO_STATIC_CONTENT_DEPLOY_MODE" \
    --jobs="$MAGENTO_STATIC_CONTENT_DEPLOY_JOBS" \
    "$MAGENTO_LANGUAGE" 

    ##
    # @note Reindex
    ##
    bin/magento indexer:reindex

    ##
    # @note Enable cache
    ##
    bin/magento cache:enable

    ##
    # @note Clean cache
    ##
    bin/magento cache:clean
    bin/magento cache:flush

    ##
    # @note Return with success
    ##
    return 0;
}

##
# @note Deploy Magento
##
main "$@"