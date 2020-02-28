# if repo is installed then soure the work script
[[ -x "$(command -v repo)" ]] && eval "$(repo script)"

# if sccache is installed add that as a rustc wrapper
[[ -x "$(command -v sccache)" ]] && {
    export RUSTC_WRAPPER="sccache"
    export SCCACHE_DIR="$HOME/.cache/sccache"
}

# if jump is installed then source 'jump shell'
[[ -x "$(command -v jump)" ]] && eval "$(jump shell)"

# if git-delta is installed then use this as the git pager
[[ -n "$(command -v delta)" ]] && {
    export GIT_PAGER="delta --dark --theme TwoDark"
} || {
    export GIT_PAGER="less"
}

