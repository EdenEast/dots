#
# ~/.bashrc
#

# Check that we haven't already been sourced.
([[ -z ${DOT_USER_BASHRC} ]] && DOT_USER_BASHRC="1") || return

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# # If for some reason that the .profile has not been loaded then source it
# [ -z $DOT_PROFILE_LOADED ]  && source $HOME/.profile

#
# History config
#
# We need HISTCONTROL to save all commands and also duplicate spaces for prompt
# HISTCONTROL=ignoredups:erasedups
HISTCONTROL=ignoredups
HISTSIZE=10000
HISTFILESIZE=15000

# Append to the history file, don't overwrite it
shopt -s histappend

#
# Bash config options
#
# Check window size after every command and update LINES and COLUMNS
shopt -s checkwinsize

# source shell config files
source $HOME/.config/shell/aliases
source $HOME/.config/shell/functions

# include all files in the before.d folder as they are needed before the bashrc.d folder
for rc in $HOME/.local/etc/bash/before.d/*.sh ; do
    source $rc
done

# include all files in the bashrc.d folder
for rc in $HOME/.local/etc/bash/bashrc.d/*.sh ; do
    source $rc
done

# include all files after the before.d and bashrc.d folder
for rc in $HOME/.local/etc/bash/after.d/*.sh ; do
    source $rc
done

function has # (command)
{
  hash "$1" &>/dev/null
}
# Setting git completion for yadm command
source $HOME/.local/etc/git/git-completion.bash
 hash "yadm" &>/dev/null  && __git_complete yadm __git_main
__git_complete g __git_main

