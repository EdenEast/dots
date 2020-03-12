
# lauch x server when logging in to tty1
[[ "$(tty)" = "/dev/tty1" ]] && {
    [[ -x $(command -v startx)]] && {
        ( pgrep xinit &>/dev/null && echo "Note: X Server is already running." || startx )
    }
}

