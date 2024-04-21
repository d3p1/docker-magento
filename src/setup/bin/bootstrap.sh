#!/bin/bash

##
# @description Deploy a Magento 2 environment
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# @note Add flag to exit script if there is an error related to a command
#       or if it is used an undefined variable
##
set -eu

##
# @note Init global/environment variables that could be useful 
#       for bootstrap/called scripts
##
declare BASE_DIR
BASE_DIR=$(dirname "${BASH_SOURCE[0]}")
export BASE_DIR

##
# @note Import required utilities
##
source $BASE_DIR/lib/execute-script.sh

##
# Main
#
# @return void
##
main() {
    local env

    ##
    # @note Ask for environment
    ##
    env=$(_execute_menu \
          "Environment: " \
          "Development" \
          "Production")

    ##
    # @note Install dependencies
    ##
    _execute_bootstrap_script "install-dependencies.sh" "$env"

    ##
    # @note Configure host 
    ##
    _execute_bootstrap_script "configure-host.sh" "$env"

    ##
    # @note Launch
    ##
    _execute_bootstrap_script "launch.sh" "$env"

    ##
    # @note Return with success
    ##
    return 0
}

##
# Execute bootstrap script
#
# @param  string $1 Script name
# @param  string $2 Environment key
# @return void
##
_execute_bootstrap_script() {
    local script

    script="$BASE_DIR/bootstrap/$1"
    execute_script "$script" "$2"
}

##
# Execute menu
#
# @param  string $1 Menu text
# @param  string $2 Menu options
# @return string Option text
# @note   Take into consideration that the option text
#         is returned as lowecase so it is easier to manage it 
#         (i.e.: to use it as a key inside the logic to evaluate it and
#         execute some behaviour)
# @note   In reality, the `shift` command and the `@` symbol as a rest operator 
#         are used to retrieve menu options. Consequently, every argument 
#         following the `$1` parameter is treated as part of `$2`, 
#         and will be used as a menu option
##
_execute_menu() {
    PS3=$1
    shift
    select option in "$@"; do
        if [ -n "$option" ]; then
            echo "$option" | tr '[:upper:]' '[:lower:]'
            break
        fi
    done
}

##
# @note Call main
##
main "$@"