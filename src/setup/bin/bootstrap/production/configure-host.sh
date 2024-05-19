#!/bin/bash

##
# @description Configure production host machine
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
source $BASE_DIR/lib/get-resources.sh
source $BASE_DIR/lib/docker/configure.sh

##
# Main
# 
# @return void
##
main() {
    ##
    # @note Configure `docker` in rootless mode to mitigate potential 
    #       vulnerabilities
    ##
    _configure_docker_rootless_mode

    ##
    # @note Configure host to work properly with search engine
    #       (OpenSearch or Elasticsearch)
    ##
    _configure_search_engine
    
    ##
    # @note Configure Traefik service
    ##
    _configure_traefik

    ##
    # @note Return with success
    ##
    return 0
}

##
# Configure Docker in rootless mode
#
# @return void
##
_configure_docker_rootless_mode() {
    ##
    # @note Notify
    ##
    echo "Configuring Docker in rootless mode..."
    
    ##
    # @note Configure Docker in rootless mode
    ##
    configure_docker_rootless_mode

    ##
    # @note Export environment variable required for 
    #       Docker Compose `traefik` service
    # @note The `$DOCKER_PATH` variable is created by the rootless mode script
    ##
    BASE_DOCKER_PATH=$DOCKER_PATH
    export BASE_DOCKER_PATH
}

##
# Implement required search engine configuration
#
# @return void
# @note   Both (Elasticsearch and OpenSearch) mentioned a similar configuration
#         (that makes sense because OpenSearch is a fork of Elasticsearch)
# @link   https://www.elastic.co/guide/en/elasticsearch/reference/7.5/docker.html#_set_vm_max_map_count_to_at_least_262144
# @link   https://opensearch.org/docs/latest/install-and-configure/install-opensearch/index/#important-settings
# @link   https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/#configure-important-host-settings
##
_configure_search_engine() {
    local MEM

    ##
    # @note Set required `vm.max_map_count`
    # @note Disable memory paging and swapping
    # @link https://stackoverflow.com/questions/4749330/how-to-test-if-string-exists-in-file-with-bash
    # @todo Create an utility function with this `grep` command
    ##
    if ! grep -Fxq "vm.max_map_count=262144" /etc/sysctl.conf; then
        echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
    fi
    sudo sysctl -p
    sudo swapoff -a

    ##
    # @note Export environment variable required for 
    #       Docker Compose `elasticsearch` and `opensearch` services
    # @note JVM heap sizes should be at least 50% of system RAM
    # @link https://stackoverflow.com/questions/2441046/how-to-get-the-total-physical-memory-in-bash-to-assign-it-to-a-variable
    # @link https://docs.oracle.com/javase/8/docs/technotes/tools/windows/java.htm
    ##
    MEM=get_ram_mem
    export BASE_SEARCH_JAVA_OPTS="-Xms${MEM}k -Xmx${MEM}k"

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
    # @note Export environment variable required for 
    #       Docker Compose `traefik`
    ##
    TRAEFIK_ACME_FILE_PATH="./$BASE_DIR/../services/traefik/etc/acme.json"
    touch "$TRAEFIK_ACME_FILE_PATH"
    chmod 600 "$TRAEFIK_ACME_FILE_PATH"
    export TRAEFIK_ACME_FILE_PATH
}

##
# @note Call main
##
main "$@"