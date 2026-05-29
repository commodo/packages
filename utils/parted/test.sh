#!/bin/sh

case "$1" in
	"parted")
		test $(/sbin/parted --version | grep '^Copyright' | wc -l) -gt 0
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
