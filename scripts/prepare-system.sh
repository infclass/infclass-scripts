#!/usr/bin/env bash

prepare_debian()
{
	installPackages+=(git)

	installPackages+=(cmake)
	installPackages+=(pkg-config)
	installPackages+=(g++)
	installPackages+=(zlib1g-dev)
	installPackages+=(libicu-dev)
	installPackages+=(libmaxminddb-dev)

	installPackages+=(screen)

	sudo DEBIAN_FRONTEND=noninteractive apt-get -q -y install "${installPackages[@]}"
}

get_os_distributive()
{
	ID_LIKE_STR=$(grep ID_LIKE /etc/os-release)
	eval ${ID_LIKE_STR}
	for ID in $ID_LIKE
	do
		if [ "$ID" = "debian" ]; then
			echo $ID
			return
		fi
	done
}

DISTRIBUTION=$(get_os_distributive)

case "$DISTRIBUTION" in
	debian|ubuntu )
		prepare_debian
		;;
	* )
		echo "The OS distribution is not supported"
		;;
esac
