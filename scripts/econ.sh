#!/bin/sh

if [ x"$CONF" = "x" ]; then
	echo "Configuration must be pre-set for this command via CONF env var"
	exit 1
fi

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

COMMAND=$@
echo -e $EC_PASSWORD\\n$COMMAND|nc localhost $EC_PORT
