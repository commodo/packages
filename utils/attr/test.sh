#!/bin/sh

case "$1" in
	attr)
		# attr does not implement --version; just verify it is present
		[ -x /usr/bin/attr ] || exit 1
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
