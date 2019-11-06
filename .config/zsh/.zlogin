#
#    ███████╗██╗      ██████╗  ██████╗ ██╗███╗   ██╗
#    ╚══███╔╝██║     ██╔═══██╗██╔════╝ ██║████╗  ██║
#      ███╔╝ ██║     ██║   ██║██║  ███╗██║██╔██╗ ██║
#     ███╔╝  ██║     ██║   ██║██║   ██║██║██║╚██╗██║
# ██╗███████╗███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║
# ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
#

# loading all files from login.d
if [ -d $HOME/.config/shell.d/login.d ]; then
    for rc in $HOME/.config/shell.d/login.d/*.sh; do
        emulate bash -c ". $rc"
    done
fi

if [ -d $HOME/.local/etc/shell.d/login.d ]; then
    for rc in $HOME/.local/etc/shell.d/login.d/*.sh; do
        emulate bash -c ". $rc"
    done
fi

