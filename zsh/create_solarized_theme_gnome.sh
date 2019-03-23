#!/usr/bin/env bash

set -o errexit

cd "$(dirname $0)"

source './theme_vars.sh'

# Creates a new, blank profile.
function create_new_profile() {
    local existing_profile_ids="$(dconf read "$dconf_profile_dir"/list | tr -d "[]")"
    [ ${#existing_profile_ids} -gt 0 ] && local delimiter=,

    local profile_id="$(uuidgen)"
    local profile_name="$1"

    gsettings set $gsettings_profiles_dir default "'$profile_id'"
    dconf write $dconf_profile_dir/list "[${existing_profile_ids}${delimiter} '$profile_id']"

    local profile_dir="$dconf_profile_dir/:$profile_id"
    dconf write $profile_dir/visible-name "'$profile_name'"

    echo $profile_id
}

# Gets the name of a profile by its ID.
function get_profile_name() {
    local profile_id="$1"

    echo $(gsettings get $gsettings_profile_dir:$dconf_profile_dir/:$profile_id/ visible-name | tr --delete "\'")
}

# Join an array of strings with the given character.
function join_on() {
    local IFS="$1"

    shift

    echo "$*"
}

# Removes any old profiles from previous playbook runs.
function remove_old_profiles() {
    local current_profile_id="$1"

    declare -a profile_ids
    profile_ids=($(gsettings get $gsettings_profiles_dir list | tr --delete "[],\'"))

    declare -a remaining_ids
    remaining_ids=()

    for profile_id in ${profile_ids[*]}; do
        local profile_name=$(get_profile_name $profile_id)

        if [[ "$profile_name" != "$base_profile_name"* ]] || [ "$profile_id" == "$current_profile_id" ];
        then
            remaining_ids+=("'$profile_id'")
            continue
        fi

        gsettings reset-recursively $gsettings_profile_dir:$dconf_profile_dir/:$profile_id/
    done

    dconf write "$dconf_profile_dir"/list "[$(join_on ',' "${remaining_ids[@]}")]"
}

profile_id=$(create_new_profile $profile_name)

pushd ~/.local/share

git clone --depth 1 https://github.com/Anthony25/gnome-terminal-colors-solarized

pushd gnome-terminal-colors-solarized
./install.sh --profile $profile_name --scheme $theme_scheme --install-dircolors
popd # gnome-terminal-colors-solarized

popd # ~/.local/share

rm --recursive --force ~/.local/share/gnome-terminal-colors-solarized

remove_old_profiles $profile_id
