#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

cd "$INSTALL_DIR"

echo "Startup ts: $TS"
echo "Server at $INSTALL_DIR"
echo "Config file: $CONF.cfg"
echo "Generated config file: $GEN_GAME_CFG"

GEN_GAME_CFG="$CONF-generated.cfg"

mkdir -p "$LOG_DIR"

if [ ! -e "$CONF.cfg" ]; then
	ln -s "$EXTRA_GAME_CFG" "$CONF.cfg"
fi

# ENABLE non-zero command exists (do NOT abort the script executions on non-zero results)
# This is needed to catch the failures of the SERVER_EXECUTABLE.
set +e

while true
do
	$SCRIPTS_PATH/generate-cfg.sh $CONF

	catchsegv ./${SERVER_EXECUTABLE} -f $GEN_GAME_CFG
	RESULT=$?

	echo "The server exited with code $RESULT"
	RESTART_DELAY=${SUCCESS_DELAY}

	if (($RESULT != 0))
	then
		RESTART_DELAY=${FAILURE_DELAY}
	fi

	echo sleep "${RESTART_DELAY}"
	sleep "${RESTART_DELAY}"
done
