#!/usr/bin/env sh

# define local folder locations
export LOCAL_BIN="$HOME/.local/bin"
export LOCAL_ETC="$HOME/.local/etc"
export LOCAL_LIB="$HOME/.local/lib"
export LOCAL_SRC="$HOME/.local/src"
export LOCAL_VAR="$HOME/.local/var"

# export XDG_DATA_HOME="${HOME}/.local/share"
# export XDG_RUNTIME_DIR="${HOME}/.local/run"
# export XDG_CACHE_HOME="${HOME}/.cache"
# export XDG_CONFIG_HOME="${HOME}/.config"

# bspwm config locations
export BSPWMRC="$LOCAL_ETC/bspwm/bspwmrc"
# export BSPWM_STATE="${XDG_CACHE_HOME}/bspwm/state.json"
# export BSPWM_FIFO="${XDG_CACHE_HOME}/bspwm/wm_state"

# editor and vim
export EDITOR="vim"
export VISUAL="vim"

# nvim does not work right now in the terminal on widnows so only
# check to see if i should use nvim when not on windows
if [ $OSTYPE != 'msys' ] && [ $OSTYPE != 'cygwin' ]; then
    if which nvim &>/dev/null; then
        export EDITOR="nvim"
        export EDITOR="nvim"
    fi
fi

# system defaults
export LANG="en_US.UTF-8"
[[ -z $(hash vivaldi-stable &>/dev/null) ]] && export BROWSER="vivaldi-stable" || export BROWSER="firefox"

# pager and less
export PAGER="less"

# filename (if known), line number if known, falling back to percent if known,
# falling back to byte offset, falling back to dash
export LESSPROMPT='?f%f .?ltLine %lt:?pt%pt\%:?btByte %bt:-...'

# i = case-insensitive searches, unless uppercase characters in search string
# F = exit immediately if output fits on one screen
# M = verbose prompt
# R = ANSI color support
# S = chop long lines (rather than wrap them onto next line)
# X = suppress alternate screen
export LESS=iFMRSX

# Color man pages.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;208m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;111m'

# update PATH
path_prepend()
{
    case ":PATH:" in
        *":$1:"*) return ;; # already added
        *) PATH="$1:$PATH" ;;
    esac
}

# adding local lib folders
[[ -d "$LOCAL_LIB" ]] && {
    for dir in $LOCAL_LIB/* $LOCAL_LIB ; do
        [ -d $dir ] && path_prepend $dir
        [ -d $dir/contrib ] && path_prepend $dir/contrib
    done
}

# adding local bin folder
[[ -d "$LOCAL_BIN" ]] && {
    for dir in $LOCAL_BIN/* $LOCAL_BIN ; do
        [ -d $dir ] && path_prepend $dir
    done
}

unset path_prepend

# lauch x server when logging in to tty1
[[ "$(tty)" = "/dev/tty1" ]] && ( pgrep i3 &>/dev/null && echo "Note: X Server is already running." || xinit )

