#!/bin/bash

function has()
{
    hash "$@" &>/dev/null
}

base=/tmp/base.png
lock=/tmp/locked.png
took_picture=false

[[ -f $base ]] && rm $base
[[ -f $lock ]] && rm $lock

has scrot convert && {
    # sleep for a short time just in case this script was run by rofi so
    # rofi is not in the picture
    sleep 0.1

    # take a screenshot of the desktop and blur it
    scrot -m -z $base
    pgrep -x dunst && notify-send -i $HOME/.config/i3/lock.png "Locking computer"
    convert $base -blur 0x8 $lock
    took_picture=true
}

# pause all media playing. (music and videos)
# has mocp && mocp -P >/dev/null
# has mpc && mpc pause >/dev/null

i3lock -e -f -c 282828 -i $lock

