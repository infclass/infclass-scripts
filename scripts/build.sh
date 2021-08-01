#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

cmake "$SOURCE_DIR" \
	-DSERVER_EXECUTABLE=${SERVER_EXECUTABLE} \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	-DCMAKE_VERBOSE_MAKEFILE=TRUE \
	-DCMAKE_CXX_FLAGS=-rdynamic

cmake --build . -t install
