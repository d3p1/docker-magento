#!/bin/bash

##
# @description An utility to execute scripts
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute script
#
# @param  string $1 Script path
# @param  string $2 Script params
# @return void
# @note   In reality, the `shift` command and the `@` symbol as a rest operator 
#         are used to retrieve script parameters. Consequently, every argument 
#         following the `$1` parameter is treated as part of `$2`, 
#         and will be used as a script parameter
##
execute_script() {
    local script

    ##
    # @note Validate and execute script
    ##
    script=$1
    shift
    if [ -e "$script" ]; then
        $script "$@"
    fi

    ##
    # @note Return with success
    ##
    return 0
}