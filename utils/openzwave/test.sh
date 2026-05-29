#!/bin/sh
case "$1" in
	openzwave)
		[ -x /usr/bin/MinOZW ] || exit 1
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
