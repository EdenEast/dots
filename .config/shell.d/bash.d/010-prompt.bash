export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# source "$HOME/.config/shell.d/bash.d/010-minimal-prompt"
[ -n "$(command -v starship)" ] && eval "$(starship init bash)" || source "$HOME/.config/shell.d/bash.d/010-minimal-prompt"

