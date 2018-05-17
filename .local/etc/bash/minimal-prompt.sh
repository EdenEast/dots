
# Global settings
MNML_OK_COLOR="${MNML_OK_COLOR:-2}"
MNML_ERR_COLOR="${MNML_ERR_COLOR:-1}"

MNML_USER_CHAR="${MNML_USER_CHAR:-λ}"
MNML_INSERT_CHAR="${MNML_INSERT_CHAR:-›}"
MNML_NORMAL_CHAR="${MNML_NORMAL_CHAR:-·}"

[ -z "$MNML_PROMPT" ] && MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status mnml_keymap)
[ -z "$MNML_RPROMPT" ] && MNML_RPROMPT=('mnml_cwd 2 0' mnml_git)
[ -z "$MNML_INFOLN" ] && MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp mnml_files)

[ -z "$MNML_MAGICENTER" ] && MNML_MAGICENTER=(mnml_me_dirs mnml_me_ls mnml_me_git)

# Components
function mnml_status
{
    local okc="$MNML_OK_COLOR"
    local errc="$MNML_ERR_COLOR"
    local uchar="$MNML_USER_CHAR"


}
