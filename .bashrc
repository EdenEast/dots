#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.config/shell/aliases
source $HOME/.config/shell/functions

PS1='[\u@\h \W]\$ '
