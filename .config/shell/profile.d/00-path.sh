#!/bin/bash

function main()
{
    function prepend_path()
    {
        case ":PATH:" in
            *":$1:") return ;; # already in path
            *) [[ -z $PATH ]] && PATH="$1" || PATH="$1:$PATH" ;;
        esac
    }

    function append_path()
    {
        echo "working $1"
        case ":PATH:" in
            *":$1:") return ;; # already in path
            *) [[ -z $PATH ]] && PATH="$1" || PATH="$PATH:$1" ;;
        esac
    }

    function check_path()
    {
        [[ -d "$2" ]] && $1 "$2"
    }

    # storing default system path and clearing the $PATH variable
    local system_path=$PATH
    unset PATH

    # adding local bin folder
    [[ -d "$LOCAL_BIN" ]] && {
        for dir in $LOCAL_BIN/* $LOCAL_BIN ; do check_path append_path $dir ; done
    }
    
    # adding local lib folder
    [[ -d "$LOCAL_LIB" ]] && {
        for dir in $LOCAL_LIB/* $LOCAL_LIB ; do check_path append_path $dir ; done
    }

    append_path /usr/local/bin
    append_path /usr/local/sbin
    append_path /usr/local/opt/srm/bin

    # Adding system path back in
    local sys_path_array=
    IFS=':' read -ra sys_path_array <<< "$system_path"
    for i in "${sys_path_array[@]}" ; do append_path $i ; done

    # On windows I have some programs that i use a lot on the command line. I want the windows
    # version of these programs instead of the version that is installed by something like
    # pacman on msys or something like that. These are the default folder locations.
    # If these directories exist then append them to the $PATH variable so I can use them
    check_path prepend_path "/c/Program Files/CMake/bin"
    check_path append_path  "/c/Program Files/Microsoft VS Code/bin"

    export PATH
    unset prepend_path
    unset append_path
    unset check_path
}

main
unset main