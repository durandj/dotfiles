#!/usr/bin/env bash

cd "$(dirname $0)"

source './theme_vars.sh'

function is_gnome_theme_configured() {
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
}

function is_kde_theme_configured() {
    [[ -f $kde_theme_file ]] && echo "true" || echo "false"
}

if [ "$is_gnome" = "yes" ]; then
    is_gnome_theme_configured
elif [ "$is_kde" = "yes" ]; then
    is_kde_theme_configured
else
    >&2 echo "Unable to determine desktop environment"

    exit 1
fi
