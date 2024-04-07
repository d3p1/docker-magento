#!/bin/sh

##
# @description Deploy a Magento 2 environment
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
    # @note Export search service
    ##
    export BASE_SEARCH_SERVICE="elasticsearch"

    ##
    # @note Export 
    # @note JVM heap sizes should be at least 50% of system RAM
    # @link https://stackoverflow.com/questions/2441046/how-to-get-the-total-physical-memory-in-bash-to-assign-it-to-a-variable
    # @link https://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.html
    ##
    MEM=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    export BASE_SEARCH_JAVA_OPTS="-Xms${MEM}k -Xmx${MEM}k"

    ##
    # @note Return with success
    ##
    return 0;
}

##
# Configure Traefik
# 
# @return void
##
_configure_traefik() {
    ##
    # @note Create file to store SSL certificates
    # @note Set correct permissions to file to avoid error:
    #       `traefik-1  | time="2024-03-26T03:03:26Z" \
    #        level=error msg="The ACME resolver \"le-http\" is skipped from \
    #        the resolvers list because: unable to get ACME account: \
    #        permissions 644 for /etc/traefik/acme.json are too open, \
    #        please use 600"`
    # @todo Analyze to ACME file path inside a variable and use it here
    #       and in Docker Compose configuration
    ##
    touch ./services/traefik/etc/acme.json
    chmod 600 ./services/traefik/etc/acme.json
}

##
# Configure Elasticsearch
# 
# @return void
# @link   https://www.elastic.co/guide/en/elasticsearch/reference/7.5/docker.html#_set_vm_max_map_count_to_at_least_262144
##
_configure_elasticsearch() {
    echo "vm.max_map_count=262144" >> /etc/sysctl.conf
    sudo sysctl -p
}

##
# Configure OpenSearch
# 
# @return void
# @link   https://opensearch.org/docs/latest/install-and-configure/install-opensearch/index/#important-settings
# @link   https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/#configure-important-host-settings
##
_configure_opensearch() {
    echo "vm.max_map_count=262144" >> /etc/sysctl.conf
    sudo sysctl -p
    sudo swapoff -a
}

##
# @note Deploy environment
##
main "$@"