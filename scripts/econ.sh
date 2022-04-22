#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

COMMAND_WITH_ARGS=1

. $SCRIPTS_PATH/common.sh

COMMAND=$@
printf "$EC_PASSWORD\n$COMMAND\n" | nc $EC_CONNADDR $EC_PORT
