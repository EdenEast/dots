
# loading all files from login.d
if [ -d $HOME/.config/shell.d/login.d ]; then
    for rc in $HOME/.config/shell.d/login.d/*.sh; do
        source $rc
    done
fi

