#!/bin/sh
# captest, filecap, netcap and pscap do not print the package version string
[ "$1" = "libcap-ng-bin" ] || exit 0
exit 0
