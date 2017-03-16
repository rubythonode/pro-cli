#!/usr/bin/env bash

PC_DIR="$HOME/.pro-cli"
WDIR=$(pwd)

. $PC_DIR/vars.sh

# show help immediately
if [ $# -eq 0 ] || [ "$1" == "help" ]; then
    help
    exit
fi

if [ "$1" == "init" ]; then
    shift 1
    printf "Initializing project files ... "
    init_project $@
    printf "${GREEN}DONE!${NORMAL}\n"
    
    exit
elif [ "$1" == "update" ]; then
    if [ ! -f "$WDIR/.pro-cli" ]; then
        printf "${RED}Not in a pro-cli project!${NORMAL}\n"
        exit
    fi

    printf "${YELLOW}Updating project structure ...${NORMAL} "
    shift 1
    init_project $@
    printf "${GREEN}DONE!${NORMAL}\n"

    printf "${YELLOW}Stopping application ...${NORMAL}\n"
    project down > /dev/null
    printf "${YELLOW}Updating docker images ...${NORMAL}\n"
    docker-compose pull > /dev/null
    printf "${GREEN}Starting application ...${NORMAL}\n"
    project up

    exit

elif [ "$1" == "install" ]; then
    PC_INSTALL=$(cat $WDIR/$PC_CONF_FILE | jq -c '.install | .[]')

    printf "${YELLOW}Installing project ...${NORMAL}\n"

    while read -r INSTALL_CMD; do
        printf "Executing: $INSTALL_CMD"
        eval "${INSTALL_CMD}" #&> /dev/null
        printf $CLEAR_LINE
    done <<< "$PC_INSTALL"

    printf "${GREEN}DONE!\n"

elif [ "$1" == "self-update" ]; then
    . $PC_DIR/update.sh
fi

. $PC_DIR/systems/docker-cli.sh
. $PC_DIR/systems/php-cli.sh
. $PC_DIR/systems/node-cli.sh

