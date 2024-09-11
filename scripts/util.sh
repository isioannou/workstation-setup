#!/usr/bin/env bash

printHeading() {
    printf "\n\e[0;36m$1\e[0m \n"
}

printDivider() {
    printf %"$COLUMNS"s |tr " " "-"
    printf "\n"
}

printStep() {
    printf %"$COLUMNS"s |tr " " "-"
    printf "\nInstalling $1...\n";
    $2 || printError "$1"
}

printError() {
    printf "\n\e[1;31m"
    printf %"$COLUMNS"s |tr " " "-"
    if [ -z "$1" ]      # Is parameter #1 zero length?
    then
        printf "     There was an error ... somewhere\n"  # no parameter passed.
    else
        printf "\n     Error Installing $1\n" # parameter passed.
    fi
    printf %"$COLUMNS"s |tr " " "-"
    printf " \e[0m\n"
}

showIDEMenuLoop() {
    # from https://serverfault.com/a/777849
    printHeading "Select Optional IDEs and Tools"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
        echo ""
        for NUM in "${!options[@]}"; do
            echo "[""${devtoolchoices[NUM]:- }""]" $(( NUM+1 ))") ${options[NUM]}"
        done
        echo ""
}