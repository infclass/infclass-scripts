#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

LOG_FILE=$(get_log_file)
tail -f -n $LOGS_TAIL_LINES "$LOG_FILE"
