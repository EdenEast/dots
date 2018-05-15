if tput setaf 1 &> /dev/null; then
    COL_RED=$(tput setaf 1)
    COL_GREEN=$(tput setaf 2)
    COL_YELLOW=$(tput setaf 3)
    COL_ORANGE=$(tput setaf 3)
    COL_BLUE=$(tput setaf 4)
    COL_MAGENTA=$(tput setaf 5)
    COL_PURPLE=$(tput setaf 5)
    COL_CYAN=$(tput setaf 6)
    COL_WHITE=$(tput setaf 7)
    COL_BLACK=$(tput setaf 8)
    COL_BOLD=$(tput bold)
    COL_RESET=$(tput sgr0)
else
    COL_RED="\u001b[31m"
    COL_GREEN="\u001b[32m"
    COL_YELLOW="\u001b[33m"
    COL_ORANGE="\u001b[31m"
    COL_BLUE="\u001b[34m"
    COL_MAGENTA="\u001b[35m"
    COL_PURPLE="\u001b[35m"
    COL_CYAN="\u001b[36m"
    COL_BOLD=""
    COL_RESET="\033[m"
fi

