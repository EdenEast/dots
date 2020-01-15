# if fzf is installed though vim then source shortcuts and completion
[[ -d "$HOME/.local/opt/fzf/bin" ]] && {
    if [[ ! "$PATH" == *${HOME}/.local/opt/fzf/bin* ]]; then
        export PATH="${PATH:+${PATH}:}${HOME}/.local/opt/fzf/bin"
    fi

    # autocomplete
    [[ $- == *i* ]] && source "${HOME}/.local/opt/fzf/shell/completion.bash" 2> /dev/null

    # keybindings
    source "${HOME}/.local/opt/fzf/shell/key-bindings.bash"
}

