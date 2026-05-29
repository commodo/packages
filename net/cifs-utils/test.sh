#!/bin/sh

case "$1" in
cifsmount)
	mount.cifs --version 2>&1 | grep -F "$2"
	;;
smbinfo)
	smbinfo --version 2>&1 | grep -F "$2"
	;;
*)
	echo "Unsupported test target: $1" >&2
	exit 1
	;;
esac
