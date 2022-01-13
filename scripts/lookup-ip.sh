#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

COMMAND_WITH_ARGS=1

IP=$1
TERM="ip=$IP"
. $SCRIPTS_PATH/lookup-helper.sh
