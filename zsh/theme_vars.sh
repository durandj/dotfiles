# The base name for managed profiles.
base_profile_name=SolarizedDark-v

# The current profile version.
profile_version=1

# The name of the terminal profile.
profile_name=$base_profile_name$profile_version

# The color scheme of the theme (light/dark).
theme_scheme=dark

# If the desktop environment is powered by Gnome.
[[ "$DESKTOP_SESSION" = "ubuntu" ]] && is_gnome="yes" || is_gnome="no"

# If the desktop environment is powered by KDE.
[[ "$DESKTOP_SESSION" = "plasma" ]] && is_kde="yes" || is_kde="no"

# DConf directory for terminal profiles.
dconf_profile_dir=/org/gnome/terminal/legacy/profiles:

# GSettings directory for listing terminal profiles.
gsettings_profiles_dir=org.gnome.Terminal.ProfilesList

# GSettings directory for getting a terminal profile.
gsettings_profile_dir=org.gnome.Terminal.Legacy.Profile

kde_theme_file="~/.kde/share/apps/konsole/Solarized\ $(tr '[:lower:]' '[:upper:]' <<< ${theme_scheme:0:1})${theme_scheme:1}.colorscheme"
