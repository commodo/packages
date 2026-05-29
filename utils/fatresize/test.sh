#!/bin/sh

case "$1" in
	"fatresize")
		test $(/sbin/fatresize -h | grep '^Please report bugs to mouse@ya.ru' | wc -l) -gt 0
		;;
	*)
		echo "Unsupported test target: $1" >&2
		exit 1
		;;
esac
