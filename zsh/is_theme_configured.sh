#!/usr/bin/env bash

cd "$(dirname $0)"

source './theme_vars.sh'

declare -a profile_ids
profile_ids=($(gsettings get $gsettings_profiles_dir list | tr --delete "[],\'"))

has_theme="false"
for profile_id in ${profile_ids[*]}; do
    name=$(gsettings get $gsettings_profile_dir:$dconf_profile_dir/:$profile_id/ visible-name | tr --delete "\'")

    if [ "$name" == "$profile_name" ];
    then
        has_theme="true"
    fi
done

echo $has_theme
