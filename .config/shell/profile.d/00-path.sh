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
        case ":PATH:" in
            *":$1:") return ;; # already in path
            *) [[ -z $PATH ]] && PATH="$1" || PATH="$PATH:$1" ;;
        esac
    }

    function check_path()
    {
        [[ -d "$2" ]] && $1 "$2"
    }

    function check_program_file_path()
    {
        local p64="/c/Program Files/$2"
        local p32="/c/Program Files (x86)/$2"
        
        check_path $1 "$p64"
        check_path $1 "$p32"
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

    check_path append_path /usr/local/bin
    check_path append_path /usr/local/sbin
    check_path append_path /usr/local/opt/srm/bin
    check_path append_path /usr/bin

    # Adding system path back in
    local sys_path_array=()
    IFS=':' read -ra sys_path_array <<< "$system_path"
    for i in "${sys_path_array[@]}" ; do check_path append_path $i ; done

    # On windows I have some programs that i use a lot on the command line. I want the windows
    # version of these programs instead of the version that is installed by something like
    # pacman on msys or something like that. These are the default folder locations.
    # If these directories exist then append them to the $PATH variable so I can use them
    check_program_file_path prepend_path "CMake/bin"
    check_program_file_path append_path  "dotnet"
    check_program_file_path append_path  "Microsoft VS Code/bin"
    check_program_file_path append_path  "Yarn/bin"
    check_program_file_path append_path  "nodejs"
    check_program_file_path append_path  "Perforce"
    check_program_file_path append_path  "MSBuild/14.0/Bin"
    check_path append_path "$HOME/AppData/Local/Programs/Microsoft VS Code/"

    export PATH=$PATH

    unset prepend_path
    unset append_path
    unset check_path
    unset check_program_file_path
}

main
unset main

