#!/bin/bash

##
# @description An utility to `envsubst` files in directory 
#              and subdirectories
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Look for files inside directory and subdirectorios that match pattern,
# and replace them with `envsubst` result
#
# @param  string $1 Directory
# @param  string $2 Pattern
# @return void
# @link   https://stackoverflow.com/questions/9612090/how-to-loop-through-file-names-returned-by-find
# @link   https://unix.stackexchange.com/questions/181937/how-create-a-temporary-file-in-shell-script
##
envsubst_files() {
    shopt -s globstar
    for file in $1/**/$2; do
        local tmp
        tmp=$(mktemp)
        envsubst < "$file" > "$tmp" && mv "$tmp" "$file"
    done
}