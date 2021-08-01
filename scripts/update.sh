#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

echo "Prepare the repo"
$SCRIPTS_PATH/prepare-repo.sh $CONF

echo "Build & Install"
$SCRIPTS_PATH/build.sh $CONF

echo "Restart when empty"
$SCRIPTS_PATH/shutdown-when-empty.sh $CONF
