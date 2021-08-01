#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

"$SCRIPTS_PATH/configure.sh"
"$SCRIPTS_PATH/update.sh"
