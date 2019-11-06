#
# Prompt config
#
export PROMPT_DIR_COLOR=$CL_CYAN
export PROMPT_MODE=left
export PROMPT_NO_INFO_LINE=true

# if repo is installed then soure the work script
[[ -x $(command -v repo) ]] && eval "$(repo script 2>/dev/null)"

