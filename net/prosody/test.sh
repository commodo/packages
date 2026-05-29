#!/bin/sh

case "$1" in
	prosody)
		grep -qF "$2" /usr/lib/prosody/prosody.version || exit 1
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
