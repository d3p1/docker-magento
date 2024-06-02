#!/bin/bash

##
# @description Launch development environment
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
source $BASE_DIR/lib/mkcert/generate-ssl-certificates.sh

##
# Main
# 
# @return void
##
main() {
    local ssl_cert_dir
    echo "Launch development environment"

    ##
    # @note Add domain to `/etc/hosts` to be able to access project from
    #       localhost without a DNS proxy configuration 
    ##
    _add_domain_to_hosts

    ##
    # @note Generate SSL certificates with `mkcert` and move them to required
    #       location so they can used by Traefik
    # @link https://github.com/d3p1/docker-magento/blob/fbd61e3da89bc5cb1d2027ae977261f22e19ec06/src/setup/services/traefik/etc/file-provider/tls.yml#L22
    ##
    ssl_cert_dir="$BASE_DIR/../services/traefik/etc/certs/"
    mkdir -p "$ssl_cert_dir"
    generate_ssl_certifcates \
    "magento" \
    "$SCRIPT_BASE_URL" \
    "$ssl_cert_dir"

    ##
    # @note Init development environment. Setup required environment variables
    ##
    _init_dev_env

    ##
    # @note Mount source code to containers
    ##
    _mount_source_code

    ##
    # @note Return with success
    ##
    return 0
}

##
# Add domain to `/etc/hosts`
#
# @return void
# @link   https://github.com/markshust/docker-magento/blob/master/compose/bin/setup-domain
# @link   https://unix.stackexchange.com/questions/464652/is-there-any-difference-between-tee-and-when-using-echo
# @link   https://stackoverflow.com/questions/4749330/how-to-test-if-string-exists-in-file-with-bash
##
_add_domain_to_hosts() {
    if ! grep -q "$SCRIPT_BASE_URL" /etc/hosts; then
        echo "Your system password is needed to add an entry to /etc/hosts..."
        echo "127.0.0.1 ::1 $SCRIPT_BASE_URL" | sudo tee -a /etc/hosts
    fi
}

##
# Init development environment
#
# @return void
##
_init_dev_env() {
    ##
    # @note Enable Xdebug in `fmp_dev` service
    # @note Init Magento in developer mode
    # @link https://github.com/magento/magento-cloud-docker/blob/414e4647902642560a83db8b9ee88541bf6d400e/images/nginx/1.24/docker-entrypoint.sh#L20
    # @link https://github.com/d3p1/docker-magento/blob/6cd8c58f3dee7eac2d60fca517acf2de82c22ad9/src/setup/services/web/.env#L22
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/images/php/8.2-cli/bin/deploy#L36
    ##
    SCRIPT_BASE_WITH_XDEBUG="1"
    SCRIPT_MAGENTO_RUN_MODE="developer"
    export SCRIPT_BASE_WITH_XDEBUG
    export SCRIPT_MAGENTO_RUN_MODE

    ##
    # @note Enable Docker Compose in developer mode 
    # @link https://github.com/d3p1/docker-magento/blob/756728d9dfb52318c64de923c500a027150ca38e/src/setup/.env#L85
    ##
    SCRIPT_COMPOSE_FILE="docker-compose.yml:docker-compose.dev.yml:services/search/${SCRIPT_SEARCH_SERVICE}/docker-compose.yml"
    export SCRIPT_COMPOSE_FILE
}

##
# Mount source code to required project containers
#
# @return void
# @link   https://github.com/d3p1/docker-magento/blob/3cc15c3c3b674805e5dc7dcae84d6155964c0c25/src/setup/docker-compose.dev.yml#L48
##
_mount_source_code() {
    local source_code_path
    echo "Would you like to use an specific path to work with the project:"
    read -r source_code_path
    if [ -n "$source_code_path" ]; then
        SCRIPT_DEV_DOC_ROOT_DIR="$source_code_path"
    else
        SCRIPT_DEV_DOC_ROOT_DIR="./www"
    fi
    export SCRIPT_DEV_DOC_ROOT_DIR
}

##
# @note Call main
##
main "$@"