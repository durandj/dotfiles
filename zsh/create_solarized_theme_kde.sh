#!/usr/bin/env bash

set -o errexit

cd "$(dirname $0)"

source './theme_vars.sh'

function main() {
    theme="$(tr '[:lower:]' '[:upper:]' <<< ${theme_scheme:0:1})${theme_scheme:1}"

    mkdir --parents $(dirname $kde_theme_file)
    wget \
        --output-document "$kde_theme_file" \
        "https://github.com/phiggins/konsole-colors-solarized/raw/master/Solarized%20$theme.colorscheme"

    mkdir --parents ~/.dir_colors
    wget \
        --output-document ~/.dir_colors/dircolors \
        "https://github.com/seebi/dircolors-solarized/raw/master/dircolors.256dark"
}

main
