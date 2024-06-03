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
# @note Call main
##
main "$@"