#!/usr/bin/env bash

set -o xtrace -o errexit

nerd_font_version=v2.0.0
font_name=SourceCodePro
font_dir=~/.local/share/fonts/NerdFonts

mkdir --parents $font_dir

pushd $font_dir
curl \
    --fail \
    --location \
    --output "$font_name.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/download/$nerd_font_version/$font_name.zip
unzip $font_name.zip
rm $font_name.zip
popd

fc-cache --force $font_dir
