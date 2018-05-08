source $HOME/.config/shell/aliases
source $HOME/.config/shell/functions

for rc in $HOME/.local/etc/zsh/zshrc.d/* ; do
    source $rc
done
