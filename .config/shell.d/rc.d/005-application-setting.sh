# if repo is installed then soure the work script
[[ -x "$(command -v repo)" ]] && eval "$(repo script)"

# if sccache is installed add that as a rustc wrapper
[[ -x "$(command -v sccache)" ]] && {
    export RUSTC_WRAPPER="sccache"
    export SCCACHE_DIR="$HOME/.cache/sccache"
}

# if jump is installed then source 'jump shell'
[[ -x "$(command -v jump)" ]] && eval "$(jump shell)"
