#!/bin/sh

SCRIPT=$(readlink -f $0)
SCRIPTS_PATH=$(dirname $SCRIPT)

. $SCRIPTS_PATH/common.sh

mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

if [ ! -d "$SOURCE_DIR_NAME" ] || [ ! -L "$SOURCE_DIR_NAME" ]; then
	read -p "The source dir (${WORK_DIR}/${SOURCE_DIR_NAME}) does not exist. Clone the repository? [Y/n]? " yn
	case "$yn" in
		[Nn]* ) exit;;
		* ) break;;
	esac
	git clone $REPOSITORY_URL $SOURCE_DIR_NAME
fi

cd "$SOURCE_DIR"

git fetch origin $REPOSITORY_BRANCH

CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

if [ "$CURRENT_BRANCH" != "$REPOSITORY_BRANCH" ]; then
	git checkout -f $REPOSITORY_BRANCH
fi

git reset --hard origin/$REPOSITORY_BRANCH
git clean -dfx
