#!/bin/sh
case "$1" in
	"ack")
		ack --version | grep "$PKG_VERSION"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
