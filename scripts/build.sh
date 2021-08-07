#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

if [ "$VERBOSE_BUILD" = "yes" ]; then
	CMAKE_VERBOSE_OPTION="-DCMAKE_VERBOSE_MAKEFILE=TRUE"
fi

cmake "$SOURCE_DIR" \
	-Wno-dev \
	-DSERVER_EXECUTABLE=${SERVER_EXECUTABLE} \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	$CMAKE_VERBOSE_OPTION \
	-DCMAKE_CXX_FLAGS=-rdynamic

cmake --build . --target install
