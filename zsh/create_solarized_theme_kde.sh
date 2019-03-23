#!/usr/bin/env bash

set -o errexit

cd "$(dirname $0)"

source './theme_vars.sh'

function main() {
    theme="$(tr '[:lower:]' '[:upper:]' <<< ${theme_scheme:0:1})${theme_scheme:1}"

    pushd ~/.local/share

    wget \
        --output-document $kde_theme_file \
        "https://github.com/phiggins/konsole-colors-solarized/raw/master/Solarized%20$theme.colorscheme"

    popd # ~/.local/share
}

main
