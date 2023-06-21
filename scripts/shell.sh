#!/bin/sh

SCRIPT="$(readlink -f $0)"
SCRIPTS_PATH="$(dirname $SCRIPT)"
ROOT_DIR="$(dirname $SCRIPTS_PATH)"
CONF_PATH="$ROOT_DIR/conf"

. "$SCRIPTS_PATH/utils.sh"
. "$CONF_PATH/global.conf"

if [ -f "$CONF_PATH/local.conf" ]; then
	. "$CONF_PATH/local.conf"
fi

CONF_EXISTED=false
CONF_IS_DEFAULT=false

if [ x"$1" != "x" ]; then
	CONF="$1"
	echo "Configuration: '$CONF'"
elif [ x"$CONF" != "x" ]; then
	echo "Configuration: '$CONF'"
else
	CONF="$DEFAULT_CONF"
fi

export CONF

#if [ "$color_prompt" = yes ]; then
#	PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#	PS1='\u@\h:\w\$ '
#fi

color_prompt=yes
if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;32m\]infclass-\[\033[01;31m\]$CONF\[\033[01;32m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='infclass-$CONF:\w\$ '
fi

export PS1
export PATH=$SCRIPTS_PATH/bin:$PATH
bash --noprofile --norc
