#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

COMMAND="$(basename $0|cut -f1 -d.)"

. $SCRIPTS_PATH/common.sh

econ $COMMAND $@ || echo Unable to submit the command
