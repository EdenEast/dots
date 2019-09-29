#!/bin/bash

user_xresources=$HOME/.Xresources
user_mod_map=$HOME/.Xmodmap
sys_xresources=/etc/X11/xinit/.Xresources
sys_mod_map=/etc/X11/xinit/.Xmodmap

# merge in defaults and key maps
[[ -f $sys_resources ]] && xrdb -merge $sys_resources
[[ -f $sys_mod_map ]] && xmodmap $sys_mod_map

[[ -f $user_xresources ]] && xrdb -merge $user_xresources
[[ -f $user_mod_map ]] && xmodmap $user_mod_map

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

# start leftwm
# [[ -f /usr/bin/leftwm  ]] && exec dbus-launch leftwm

# start awesome
[[ -f /usr/bin/awesome ]] && exec awesome

# start i3 and keep it running
# [[ -f /usr/bin/i3 ]] && exec i3

# start bspwm and sxhkd
# [[ -f /usr/bin/bspwm ]] && exec bspwm
