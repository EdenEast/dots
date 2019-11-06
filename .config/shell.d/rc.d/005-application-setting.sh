# if repo is installed then soure the work script
[[ -x $(command -v repo) ]] && eval "$(repo script 2>/dev/null)"

# if sccache is installed add that as a rustc wrapper
[[ $(command -v sccahe) ]] && export RUSTC_WRAPPER="$(which sccache)"

# if jump is installed then source 'jump shell'
[[ $(command -v jump) ]] && eval "$(jump shell)"
