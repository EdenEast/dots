#
# ~/.bash_logout
#

# when leaving the console clear the screen to increase privacy
[[ "$SHLVL" = 1 ]] && {
    [[ -x /usr/bin/clear_console ]] && /usr/bin/clear_console -q
}
