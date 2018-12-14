#!/bin/bash

dialog=$(echo -e 'lock\nsuspend\nhibernate\nshutdown\nreboot\nexit i3' | rofi -dmenu -i -p "[Exit option]" -hide-scrollbar -tokenize -lines 6 -eh 2 -width 40 -location 8 -xoffset 150 -yoffset 70 -padding 50 -font "inconsolata 16")

case $dialog in
    lock)      i3lock ;;
    suspend)   systemctl suspend ;;
    hibernate) systemctl hibernate ;;
    shutdown)  systemctl poweroff ;;
    reboot)    systemctl reboot ;;
    "exit i3") i3-msg exit ;;
esac
