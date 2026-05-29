#!/bin/sh

case "$1" in
	domoticz)
		[ -x /usr/bin/domoticz ] || exit 1
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
