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

[[ -x "$(command -v rustup)" ]] && {
    # install stable rust
    rustup install stable

    # install nightly
    rustup toolchain add nightly

    # setting default toolchain to be stable
    rustup default stable

    rustup component add rls rust-analysis rust-src
    rustup component add clippy
    rustup component add racer

    # install sccache and then force it to be the rustc_wrapper
    cargo install sccache
    export RUSTC_WRAPPER=sccache

    # try to install racer but, as it is nightly it might fail
    cargo +nightly install racer

    # useful rust applications for developing rust
    cargo install just
    cargo install mdbook

    # cargo extensions
    cargo install cargo-bloated
    cargo install cargo-deps
    cargo install cargo-edit
    cargo install cargo-expand
    cargo install cargo-outdated
    cargo install cargo-release
    cargo install cargo-tree
    cargo install cargo-update
}

## web dev
inst nodejs npm yarn

## browsers

inst firefox
yay -S --noconfirm brave-dev-bin
