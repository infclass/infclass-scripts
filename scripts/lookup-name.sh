#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

COMMAND_WITH_ARGS=1

NAME=$1
TERM="${NAME}.*ip="
. $SCRIPTS_PATH/lookup-helper.sh
