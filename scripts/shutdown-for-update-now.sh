#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

COMMAND="shutdown An update installed. Please reconnect."
econ $COMMAND
