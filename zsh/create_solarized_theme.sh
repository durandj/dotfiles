#!/usr/bin/env bash

set -o errexit

cd "$(dirname $0)"

source './theme_vars.sh'

function main() {
    if [ "$is_gnome" == "yes" ]; then
        ./create_solarized_theme_gnome.sh
    elif [ "$is_kde" == "yes" ]; then
        ./create_solarized_theme_kde.sh
    fi
}

main
