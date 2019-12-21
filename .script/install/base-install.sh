#!/bin/bash

function inst # ()
{
    sudo pacman -S --noconfirm --needed "$@"
}

sudo pacman -Syy

# System
inst light

# Sound
inst alsa-lib alsa-utils alsa-plugins alsa-firmware
inst pulseaudio pulseaudio-alsa pamixer playerctl

# Core packages
inst tmux git git-lfs vim neovim exa fd rofi ripgrep dmenu bat

# Media
inst mpc mpd mpv ncmpcpp

# terminals
inst alacritty rxvt-unicode kitty

# ----------------------------------------------------------
# Window managers
inst awesome

# ----------------------------------------------------------
# Development

## c++
inst make cmake gcc clang

## rust
inst rustup
bash ./rust.sh

## web dev
inst nodejs npm yarn

## browsers

inst firefox
yay -S --noconfirm brave-dev-bin
