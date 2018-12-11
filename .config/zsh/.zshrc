
# changing the location of zcompdump files to .cache
mkdir -p $HOME/.cache/zsh
autoload -U compinit
compinit -d $HOME/.cache/zsh/zcompdump-$(whoami)-$ZSH_VERSION

# Path to oh-my-zsh
export ZSH=$HOME/.local/etc/zsh/oh-my-zsh

# oh-my-zsh options
ENABLE_CORRECTION=false            # I dont need corrections
COMPLETION_WATING_DOTS=true        # Don't show red dots while waiting for completion
DISABLE_UNTRACTED_FILES_DIRTY=true # Untracted files are not dirty
DISABLE_AUTO_UPDATE=true           # I will handle updates myself with dots repo

plugins=(git)

# Stop trying to correct me. I am not that bad
unsetopt correct_all

source $ZSH/oh-my-zsh.sh
emulate bash -c 'source $HOME/.config/shell/aliases'
emulate bash -c 'source $HOME/.config/shell/functions'


for rc in $HOME/.local/etc/zsh/zshrc.d/* ; do
    source $rc
done

source $HOME/.local/etc/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Note: this must be the last source file
source $HOME/.local/etc/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
