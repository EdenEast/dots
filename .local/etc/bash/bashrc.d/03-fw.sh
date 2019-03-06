if [[ -x $(command -v fw) ]]; then
    if [[ -x "$(command -v fzf)" ]]; then
        eval "$(fw print-bash-setup -f 2>/dev/null)"
    else
        eval "$(fw print-bash-setup 2>/dev/null)"
    fi
fi
