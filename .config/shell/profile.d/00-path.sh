#!/bin/bash

function main()
{
    function append_path()
    {
        case ":PATH:" in
            *":$1:") return ;; # already in path
            *) [[ -z $PATH ]] && PATH="$1" || PATH="$PATH:$1" ;;
        esac
    }

    function check_path()
    {
        [[ -d "$1" ]] && append_path "$1"
    }

    # storing default system path and clearing the $PATH variable
    local system_path=$PATH
    unset PATH

    # adding local bin folder
    [[ -d "$LOCAL_BIN" ]] && {
        for dir in $LOCAL_BIN/* $LOCAL_BIN ; do check_path $dir ; done
    }
    
    # adding local lib folder
    [[ -d "$LOCAL_LIB" ]] && {
        for dir in $LOCAL_LIB/* $LOCAL_LIB ; do check_path $dir ; done
    }

    append_path $system_path

    # On windows I have some programs that i use a lot on the command line. I want the windows
    # version of these programs instead of the version that is installed by something like
    # pacman on msys or something like that. These are the default folder locations.
    # If these directories exist then append them to the $PATH variable so I can use them
    check_path "/c/Program Files/CMake/bin"
    check_path "/c/Program Files/Microsoft VS Code/bin"

    export PATH
    unset append_path
    unset check_path
}

main
unset main