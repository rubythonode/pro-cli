#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # #
# execute npm commands
if [ "$1" == "npm" ]; then
    if ( needs_help $@ ); then
        printf "${YELLOW}usage:${NORMAL} project npm [command]\n\n"
        printf "OPTIONS:\n"
        printf "    ${BLUE}--auth='user:password'${NORMAL}${PC_HELP_SPACE:22}Secure the application with basic auth.${NORMAL}\n"
        exit
    fi

    shift
    $RUN node npm $@
    exit

# # # # # # # # # # # # # # # # # # # #
# execute yarn commands
elif [ "$1" == "yarn" ]; then
    shift
    $RUN yarn yarn $@
    exit
fi
