#!/bin/sh

case "$1" in
	"xray-core")
		xray version 2>&1 | grep "${2#*v}"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
