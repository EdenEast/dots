#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# History config
#
# Do not duplicate lines or lines starting with space in history file
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=15000

# Append to the history file, don't overwrite it
shopt -s histappend

#
# Bash config options
#
# Check window size after every command and update LINES and COLUMNS
shopt -s checkwinsize

source $HOME/.config/shell/aliases
source $HOME/.config/shell/functions

for rc in $HOME/.local/etc/bash/bashrc.d/* ; do
    source $rc
done

# function prompt_right() {
#   echo -e "\033[0;36m\\\t\033[0m"
# }

# function prompt_left() {
#   echo -e "\033[0;35m\w\033[0m"
# }

# function prompt() {
#     compensate=5
#     PS1=$(printf "%*s\r%s\n\$ " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
# }
# PROMPT_COMMAND=prompt
# # PS1='[\u@\h \W]\$ '
