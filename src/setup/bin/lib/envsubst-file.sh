#!/bin/bash

##
# @description An utility to `envsubst` file content
# @author      C. M. de Picciotto <d3p1@d3p1.dev> (https://d3p1.dev/)
##

##
# Execute and replace file content with `envsubst` result
#
# @param  string $1 File path
# @return void
##
envsubst_file() {
    local tmp
    tmp=$(mktemp)
    envsubst < "$1" > "$tmp" && mv "$tmp" "$1"
}