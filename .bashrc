#
#    ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#    ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#    ██████╔╝███████║███████╗███████║██████╔╝██║
#    ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║
# ██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#

# if shell is not interactive then we be done here
[[ $- != *i* ]] && return


[[ -d $HOME/.config/shell.d/rc.d ]] && {
    for rc in $HOME/.config/shell.d/rc.d/*.sh; do
        source $rc
    done
}

[[ -d $HOME/.config/shell.d/bashrc.d ]] && {
    for rc in $HOME/.config/shell.d/bashrc.d/*.bash; do
        source $rc
    done
}

