# if fzf is installed though vim then source shortcuts and completion
[[ -d "$HOME/.local/opt/fzf/bin" ]] && {

    _fzf_preview() {
        [[ $(file -mime $1) =~ binary ]] && {
            echo "$1 is a binary file"
        } || {
            (bat --style=numbers --color=always $1 || cat $1) 2>/dev/null | head -150
        }
    }

    FD_DEFAULT_OPS="--follow --exclude .git --exclude node_modules"
    export FZF_DEFAULT_OPS="--no-mouse --height 50% --reverse --multi --inline-info --preview='_fzf_preview {}' --preview-window='right:hidden:wrap' --bind='f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"
    export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_DEFAULT_OPS"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


    if [[ ! "$PATH" == *${HOME}/.local/opt/fzf/bin* ]]; then
        export PATH="${PATH:+${PATH}:}${HOME}/.local/opt/fzf/bin"
    fi

    # autocomplete
    [[ $- == *i* ]] && source "${HOME}/.local/opt/fzf/shell/completion.bash" 2> /dev/null

    # keybindings
    source "${HOME}/.local/opt/fzf/shell/key-bindings.bash"
}

