#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

grep -e $TERM -R "$INSTALL_DIR/$LOG_DIR" | cut -d [ -f 2,3,7| cut -d ' ' -f 1,4- | sed 's/:[0-9]*\]/\]/g' | uniq
