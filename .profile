# define local folder locations
export LOCAL_BIN="$HOME/.local/bin"
export LOCAL_ETC="$HOME/.local/etc"
export LOCAL_LIB="$HOME/.local/lib"
export LOCAL_SRC="$HOME/.local/src"
export LOCAL_VAR="$HOME/.local/var"

# export XDG_DATA_HOME="${HOME}/.local/share"
# export XDG_RUNTIME_DIR="${HOME}/.local/run"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"

# editor and vim
[[ -n "$(command -v nvim)" && "$OSTYPE" != 'msys' ]] && {
    export EDITOR='nvim'
    export VISUAL='nvim'
} || {
    export EDITOR="vim"
    export VISUAL="vim"
}

# system defaults
export LANG="en_US.UTF-8"

# export BROWSER
browser_list=('vivaldi' 'vivaldi-stable' 'firefox' 'opera' 'chrome')
for b in ${browser_list[@]}; do
    hash $b &>/dev/null && export BROWSER="$b" && break;
done

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

# fw config file location should respect ${XDG_CONFIG_HOME}/fw/config
export FW_CONFIG_PATH="$XDG_CONFIG_HOME/fw/config"

# Soruce all *.sh file in the folder profile.d in .config file
for rc in $HOME/.config/shell/profile.d/*.sh ; do
    source $rc
done

export DOT_PROFILE_LOADED=true

# lauch x server when logging in to tty1
[[ "$(tty)" = "/dev/tty1" ]] && ( pgrep i3 &>/dev/null && echo "Note: X Server is already running." || startx )

