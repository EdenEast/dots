#!/bin/bash

user_xresources=$HOME/.Xresources
user_mod_map=$HOME/.Xmodmap
sys_xresources=/etc/X11/xinit/.Xresources
sys_mod_map=/etc/X11/xinit/.Xmodmap
local_theme_xresoures=$HOME/.local/share/theme/.Xresources

# merge in defaults and key maps
[[ -f $sys_resources ]] && xrdb -merge $sys_resources
[[ -f $sys_mod_map ]] && xmodmap $sys_mod_map

[[ -f $user_xresources ]] && xrdb -merge $user_xresources
[[ -f $user_mod_map ]] && xmodmap $user_mod_map

[[ -f $local_theme_xresoures ]] && xrdb -merge $local_theme_xresoures

# start some programs
[[ -d /etc/X11/xinit/xinitrc.d ]] && {
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [[ -x "$f" ]] && . "$f"
    done
    unset f
}

# turn off the cpu default bell
[[ -f /usr/bin/xset ]] && xset -b

# if redshift is installed then launch it
[[ -f /usr/bin/redshift ]] && redshift &

# -----------------------------------------------------------------------------
# Window managers

# awesome
[[ -f /usr/bin/awesome ]] && exec dbus-launch awesome

# bspwm
# [[ -f /usr/bin/bspwm ]] && exec dbus-launch bspwm

# i3
# [[ -f /usr/bin/i3 ]] && exec dbus-launch i3

# leftwm
# [[ -f /usr/bin/leftwm  ]] && exec dbus-launch leftwm

# qtile
# [[ -f /usr/bin/qtile  ]] && exec dbus-launch qtile

# xmonad
# [[ -f /usr/bin/xmonad  ]] && exec dbus-launch xmonad
