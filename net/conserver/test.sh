#!/bin/sh

case "$1" in
	"conserver")
		conserver -V | grep "$2"
		;;
	"conserver-ipmi")
		conserver -V | grep "$2"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
