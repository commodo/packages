#!/bin/sh

case "$1" in
	"openelp")
		openelpd -V | grep "$2"
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
