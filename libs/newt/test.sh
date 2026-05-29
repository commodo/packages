#!/bin/sh

case "$1" in

python3-newt)
	python3 -c 'import snack'
	;;

whiptail)
	whiptail --version | grep -Fx "whiptail (newt): $PKG_VERSION"
	;;

*)
	echo "Unsupported test target: $1" >&2
	exit 1
	;;
esac
