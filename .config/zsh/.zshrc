source $HOME/.config/shell/aliases
source $HOME/.config/shell/functions

source $HOME/.local/etc/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/etc/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

for rc in $HOME/.local/etc/zsh/zshrc.d/* ; do
    source $rc
done
