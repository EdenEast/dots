
_git_open ()
{
    case "$cur" in
        --*) __gitcomp "--issue" ;;
        *)
            local remotes="$(__git_remotes)"
            local remote="$(__git_find_on_cmdline "$remotes")"
            if [ -n "$remote" ]; then
                local branches=$(git branch -r | grep -v '\->' | grep $remote | cut -d '/' -f 2)
                __gitcomp_nl "$branches"
            else
                __gitcomp_nl "$remotes"
            fi
            ;;
    esac
}
