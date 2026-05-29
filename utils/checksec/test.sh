#!/bin/sh

case "$1" in
	checksec)
		# Analyze a known binary; output must include the binary path
		checksec --file=/usr/bin/checksec 2>&1 | grep -qF "checksec"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
