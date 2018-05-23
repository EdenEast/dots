#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# History config
#
# We need HISTCONTROL to save all commands and also duplicate spaces for prompt
HISTCONTROL=
HISTSIZE=10000
HISTFILESIZE=15000

# Append to the history file, don't overwrite it
shopt -s histappend

#
# Prompt config
#
PROMPT_MODE=left
# PROMPT_DIR_COLOR=$COL_BLUE


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
for rm in $HOME/.local/etc/bash/after.d/*.sh ; do
    source $rc
done

