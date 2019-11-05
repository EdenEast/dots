
# lauch x server when logging in to tty1
[[ "$(tty)" = "/dev/tty1" ]] && {
    ( pgrep xinit &>/dev/null && echo "Note: X Server is already running." || startx )
}

