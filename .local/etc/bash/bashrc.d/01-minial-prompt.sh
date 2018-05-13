
PROMPT_OK_COLOR=${PROMPT_OK_COLOR:-$GREEN}
PROMPT_ERR_COLOR=${PROMPT_ERR_COLOR:-$RED}

PROMPT_USER_CHAR="${PROMPT_USER_CHAR:-λ}"
PROMPT_INPUT_CHAR="${PROMPT_INPUT_CHAR:-›}"

PROMPT_COMPONENTS=()
RPROMPT_COMPONENTS=()
PROMPT_INFOLINE=()

#
# Components
#

function pmt_user()
{
    echo ""
}

function pmt_err()
{
    echo ""
}

function pmt_cwd()
{
    local segments="${1:-2}"
    [[ "$segments" -le 0 ]] && segments=1

    # store pwd and change $HOME to ~
    local cwd=${PWD/$HOME/\~}
    OLD_IFS=$IFS
    IFS='/' cwd=($cwd)
    IFS=$OLD_IFS

    local dir_size=${#cwd[@]}

    local result=""
    [[ $dir_size -ge $segments ]] && {
        local diff=$(($dir_size - $segments))
        for ((i=${#cwd[@]}-1; i>=$diff; i--)) ; do
            [[ -z $first ]] && result="${cwd[$i]}" || result="${cwd[$i]}/$result"
            first=true
        done
    } || {
        result=$cwd
    }
    echo $result
}

#
# Wrappers and utils
#

pmt_cwd
# PROMPT_COMMAND=_build_prompt

