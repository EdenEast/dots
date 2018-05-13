if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        RED=$(tput setaf 160)
        GREEN=$(tput setaf 40)
        YELLOW=$(tput setaf 184)
        ORANGE=$(tput setaf 172)
        BLUE=$(tput setaf 33)
        MAGENTA=$(tput setaf 93)
        PURPLE=$(tput setaf 63)
        CYAN=$(tput setaf 45)
    else
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        ORANGE=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        PURPLE=$(tput setaf 5)
        CYAN=$(tput setaf 6)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
    COLS=$(tput cols)
else
    RED="\u001b[31m"
    GREEN="\u001b[32m"
    YELLOW="\u001b[33m"
    ORANGE="\u001b[31m"
    BLUE="\u001b[34m"
    MAGENTA="\001b[35m"
    PURPLE="\u001b[35m"
    CYAN="\u001b[36m"
    BOLD=""
    RESET="\033[m"
    COLS=$COLUMNS
fi

