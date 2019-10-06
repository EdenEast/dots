#!/bin/bash

function open_dir () # directory
{
    exec urxvt -e sh -c "cd $@ && vim -c 'CtrlP'" .
}

function open_file () # file
{
    exec urxvt -e sh -c "vim $@"
}

declare -a options=("
awesome
bash
git
i3
polybar
qtile
vim
xmonad
xrdb
xresource
zsh
quit
")

choice=$(echo -e "${options[@]}" | rofi -dmenu -i -p 'Edit config file' -hide-scrollbar --tokenize)

case $choice in
    awesome   ) open_dir     $HOME /.config/awesome   ;;
    bash      ) open_file    $HOME /.bashrc           ;;
    git       ) open_dir     $HOME /.config/git       ;;
    i3        ) open_file    $HOME /.config/i3/config ;;
    polybar   ) open_file    $HOME /.config/polybar   ;;
    qtile     ) open_file    $HOME /.config/qtile     ;;
    xmonad    ) open_dir     $HOME /.xmonad           ;;
    vim       ) open_dir     $HOME /.config/vim       ;;
    xrdb      ) open_dir     $HOME /.config/xrdb      ;;
    xresource ) open_file    $HOME /.XResources       ;;
    zsh       ) open_dir vim $HOME /.config/zsh       ;;
esac
