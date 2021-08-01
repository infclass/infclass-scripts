# Core functions

echo_error()
{
	echo "$@" 1>&2
}

read_not_null()
{
	eval DEFAULT_VALUE=\${$1}

	if [ x"$DEFAULT_VALUE" = "x" ]; then
		TEXT="$2: "
	else
		TEXT="$2 [$DEFAULT_VALUE]: "
	fi

	read -p "$TEXT" RESULT

	if [ x"$RESULT" = "x" ]; then
		RESULT="$DEFAULT_VALUE"
	fi
	eval "$1=\"$RESULT\""
}

yes_no_unknown()
{
	case "$1" in
		[Yy]* )
			eval "$2=yes"
			;;
		[Nn]* )
			eval "$2=no"
			;;
		* )
			eval "$2=unknown"
			;;
	esac
}

read_yes_no()
{
	eval PREVIOUS_VALUE=\${$1}
	SUGGESTED_VALUE=$3
	yes_no_unknown "$PREVIOUS_VALUE" DEFAULT_VALUE

	if [ "$DEFAULT_VALUE" = "unknown" ]; then
		yes_no_unknown "$SUGGESTED_VALUE" DEFAULT_VALUE
	fi

	if [ "$DEFAULT_VALUE" = "yes" ]; then
		ANSWERS="Y/n"
	else
		ANSWERS="y/N"
	fi

	read -p "$2 [$ANSWERS]? " RESULT
	yes_no_unknown "$RESULT" RESULT

	if [ "$RESULT" = "unknown" ]; then
		RESULT=$DEFAULT_VALUE
	fi

	eval "$1=\"$RESULT\""
}
