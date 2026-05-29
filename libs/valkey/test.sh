#!/bin/sh

case "$1" in
	valkey-server)
		valkey-server --version | grep -F "$2"
		;;
	valkey-cli)
		valkey-cli --version | grep -F "$2"
		;;
	valkey-utils)
		valkey-benchmark --version | grep -F "$2"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
