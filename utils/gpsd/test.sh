#!/bin/sh

case "$1" in
	"gpsd")
		gpsd -V 2>&1 | grep "$2"
		;;
	"gpsd-clients")
		cgps -V 2>&1 | grep "$2"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
