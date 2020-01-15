# if fzf is installed though vim then source shortcuts and completion
[[ -n "$(command -v fzf)" ]] && {
    if [[ ! "$PATH" == *${HOME}/.local/opt/fzf/bin* ]]; then
        export PATH="${PATH:+${PATH}:}${HOME}/.local/opt/fzf/bin"
    fi

    # autocomplete
    [[ $- == *i* ]] && source "${HOME}/.local/opt/fzf/shell/completion.bash" 2> /dev/null

    # keybindings
    source "${HOME}/.local/opt/fzf/shell/key-bindings.bash"
}

