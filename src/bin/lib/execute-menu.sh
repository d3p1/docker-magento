#!/bin/bash

##
# @description An utility to execute a menu
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

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
execute_menu() {
    PS3=$1
    shift
    select option in "$@"; do
        if [ -n "$option" ]; then
            echo "$option" | tr '[:upper:]' '[:lower:]'
            break
        fi
    done
}