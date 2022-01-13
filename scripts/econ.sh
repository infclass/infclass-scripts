#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

COMMAND_WITH_ARGS=1

. $SCRIPTS_PATH/common.sh

COMMAND=$@
echo -e $EC_PASSWORD\\n$COMMAND|nc localhost $EC_PORT
