#!/bin/sh

case "$1" in
	sudo)
		sudo --version | grep "${2//_p/p}"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
