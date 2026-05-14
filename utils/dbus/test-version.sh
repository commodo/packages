#!/bin/sh
# dbus-monitor, dbus-send and dbus-test-tool do not print the package version
[ "$1" = "dbus-utils" ] || exit 0
exit 0
