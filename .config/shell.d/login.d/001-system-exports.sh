# define local folder locations
export LOCAL_BIN="$HOME/.local/bin"
export LOCAL_ETC="$HOME/.local/etc"
export LOCAL_LIB="$HOME/.local/lib"
export LOCAL_SRC="$HOME/.local/src"
export LOCAL_VAR="$HOME/.local/var"

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

# pager and less
[[ -n "$(command -v bat)" ]] && export PAGER="bat" || export PAGER="less"

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

