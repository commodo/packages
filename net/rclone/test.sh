#!/bin/sh

case "$1" in
	"rclone")
		rclone version | grep "$2"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
