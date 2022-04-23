set -e

CONF_PATH=$SCRIPTS_PATH/../conf

. "$SCRIPTS_PATH/utils.sh"
. "$CONF_PATH/global.conf"

if [ -f "$CONF_PATH/local.conf" ]; then
	. "$CONF_PATH/local.conf"
fi

if [ x"$COMMAND_WITH_ARGS" = x"1" ]; then
	if [ x"$CONF" = "x" ] && [ x"$USE_DEFAULT_CONF_WITH_ARGS" = x"yes" ]; then
		CONF="$DEFAULT_CONF"
	fi

	if [ x"$CONF" = "x" ]; then
		echo "Configuration must be pre-set for this command via CONF env var"
		exit 1
	fi
elif [ x"$CONF" = "x" ] && [ x"$1" != "x" ]; then
	CONF="$1"
	echo "Configuration: '$CONF'"
fi

if [ x"$CONF" = "x" ]; then
	CONF="$DEFAULT_CONF"
	echo "Forced '$CONF' configuration"
fi

if [ -f "$CONF_PATH/$CONF.conf" ]; then
	. "$CONF_PATH/$CONF.conf"
elif [ x"$CONF" = "x$DEFAULT_CONF" ]; then
	echo_error "Fatal: The default configuration not found. Run 'configure' first"
	exit 1
else
	echo_error "Fatal: Configuration \"$CONF\" not found. Run 'configure $CONF' first"
	exit 1
fi

ROOT_DIR="$(dirname $SCRIPTS_PATH)"
WORK_DIR="$ROOT_DIR/$CONF"

SOURCE_DIR_NAME="sources"
SOURCE_DIR="$WORK_DIR/$SOURCE_DIR_NAME"
BUILD_DIR="$WORK_DIR/build"
INSTALL_DIR="$WORK_DIR/install"
LOG_DIR="logs"

EXTRA_GAME_CFG="$ROOT_DIR/game-conf/$CONF.cfg"

# Extra functions for other scripts

econ()
{
	env CONF=$CONF "$SCRIPTS_PATH/econ.sh" $@
}

get_log_file()
{
	GEN_GAME_CFG="$INSTALL_DIR/$CONF-generated.cfg"
	if [ ! -e "$GEN_GAME_CFG" ]; then
		echo_error "Config file \"$GEN_GAME_CFG\" is not accessible"
		exit 1
	fi
	LOGFILE=$INSTALL_DIR/$(grep Logfile "$GEN_GAME_CFG"|cut -f 2- -d ' ')
	echo $LOGFILE
}
