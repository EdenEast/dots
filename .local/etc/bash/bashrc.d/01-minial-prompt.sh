
PROMPT_OK_COLOR=${PROMPT_OK_COLOR:-$COL_GREEN}
PROMPT_ERR_COLOR=${PROMPT_ERR_COLOR:-$COL_RED}

PROMPT_DIR_COLOR=${PROMPT_DIR_COLOR:-$COL_BLACK}
PROMPT_PATH_SEP_COLOR=${PROMPT_PATH_SEP_COLOR:-$COL_WHITE}

PROMPT_INFO_COLOR=${PROMPT_INFO_COLOR:-$COL_BLACK}

PROMPT_USER_CHAR="${PROMPT_USER_CHAR:-λ}"
PROMPT_INPUT_CHAR="${PROMPT_INPUT_CHAR:-›}"
PROMPT_CWD_SEGMENT_COUNT=${PROMPT_CWD_SEGMENT_COUNT:-2}
PROMPT_TRAILING_SPACE=true

PROMPT_COMPONENTS=(pmt_status pmt_user pmt_input)
RPROMPT_COMPONENTS=(pmt_cwd)
PROMPT_INFOLINE_COMPONENTS=(pmt_uhp pmt_pwd pmt_files)

#
# Components
#

function pmt_status()
{
    local uchar="$PROMPT_USER_CHAR"
    local ucolor="$PROMPT_OK_COLOR"
    [[ "$PROMPT_LAST_ERROR" -ne 0 ]] && ucolor="$PROMPT_ERR_COLOR"

    echo "$ucolor$uchar$COL_RESET"
}

function pmt_user()
{
    if [[ -n $SSH_CONNECTION ]]; then
        me="\u@\h"
    elif [[ $LOGNAME != $USER ]]; then
        me='\u'
    fi

    [[ -n $me ]] && echo "${COL_BLUE}$me${COL_RESET}:"
}

function pmt_input()
{
    echo "${PROMPT_INPUT_CHAR}"
}

function pmt_name()
{
    echo $(whoami)
}

function pmt_pwd()
{
    local c=${PROMPT_INFO_COLOR}
    local r=${COL_RESET}
    local cwd=${PWD/$HOME/\~}
    OLD_IFS=$IFS
    IFS='/' cwd=($cwd)
    IFS=$OLD_IFS

    local result=""
    for i in ${cwd[@]} ; do
        [[ -z $first ]] && result="$c$i" || result="$result$r/$c$i"
        first=true
    done

    echo $result
    # echo $cwd
}

function pmt_uhp
{
    local user_name=$(whoami)
    local host_name=$(hostname -s)
    local col=$PROMPT_INFO_COLOR
    local rst=$COL_RESET

    echo "$col$user_name$rst@$col$host_name$rst"
}

function pmt_files()
{
    local a="$(ls -1A | sed -n '$=')"  # all files
    local v="$(ls -1 | sed -n '$=')"   # visable files
    a=${a:-0}
    v=${v:-0}
    local h="$(($a - $v))" # hidden files

    local c=$PROMPT_INFO_COLOR
    local r=$COL_RESET

    local output="$r[$c${v:-0}"
    [[ ${h:-0} -gt 0 ]] && output="$output $r($c$h$r)"
    output="$output$r]"
    echo $output
}

function pmt_cwd()
{
    local dir_col=$PROMPT_DIR_COLOR
    local sep_col=$PROMPT_PATH_SEP_COLOR

    local segments=${PROMPT_CWD_SEGMENT_COUNT}
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
            [[ -z $first ]] && result="${cwd[$i]}" || result="$dir_col${cwd[$i]}$sep_col/$dir_col$result"
            first=true
        done
    } || {
        result=$dir_col$cwd
    }
    echo $result$COL_RESET
}

function pmt_jobs()
{
    local count=$(jobs | sed -n '$=')
    [[ $count -gt 0 ]] && echo "$count&"
}

#
# Magic enter components
#

function pmt_me_ls()
{
    # there has to be something for darwin because --color does not work
    ls -C -F --color=always -w $COLUMNS
}

#
# Wrappers and utils
#

function _pmt_wrap()
{
    local input=("$@")
    local arr=()
    local cmd_out=""
    local cmd
    for cmd in ${input[@]} ; do
        cmd_out="$(eval "$cmd")"
        [[ -n "$cmd_out" ]] && arr+=($cmd_out)
    done

    echo "${arr[@]}"
}

function _check_blank_line()
{
    local last_command="$(history 1)"
    local result=false
    [[ "$_CHECK_BANK_PREVIOUS_LINE" = "$last_command" ]] && result=true
    export _CHECK_BANK_PREVIOUS_LINE="$last_command"
    export _CHECK_BLANK_RESULT=$result
}

function _build_info_line()
{
    local line_output=$(_pmt_wrap ${PROMPT_INFOLINE_COMPONENTS[@]})
    [[ -n $line_output ]] && echo $line_output
}

function _build_prompt()
{
    _check_blank_line
    # echo $_CHECK_BLANK_RESULT
    [[ $_CHECK_BLANK_RESULT = "true" ]] && _build_info_line
    local left_prompt=$(_pmt_wrap ${PROMPT_COMPONENTS[@]})
    local right_prompt=$(_pmt_wrap ${RPROMPT_COMPONENTS[@]})

    # strip out the escape color sequences to get an accuate count of the right prompt chars
    local right_stripped=$(sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" <<<"$right_prompt")

    local save_cursor='\e[s' # Save cursor position
    local reset_cursor='\e[u' # Restore cursor position to save point

    [[ $PROMPT_TRAILING_SPACE ]] && trailing_space=" "
    PS1="\[${save_cursor}\e[${COLUMNS}C\e[${#right_stripped}D${right_prompt}${reset_cursor}\]${left_prompt}$trailing_space"
}

PROMPT_COMMAND=_build_prompt

