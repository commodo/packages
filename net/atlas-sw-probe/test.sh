#!/bin/sh

[ "$1" = atlas-sw-probe ] || exit 0

SCRIPTS_DIR=/usr/libexec/atlas-probe-scripts

# Main entry script and key generated scripts (flat in bin/)
for f in \
    "$SCRIPTS_DIR/bin/ATLAS" \
    "$SCRIPTS_DIR/bin/resolvconf" \
    "$SCRIPTS_DIR/bin/config.sh" \
    "$SCRIPTS_DIR/bin/paths.lib.sh" \
    "$SCRIPTS_DIR/bin/common-pre.sh" \
    "$SCRIPTS_DIR/bin/common.sh" \
    "$SCRIPTS_DIR/bin/reginit.sh" \
    "$SCRIPTS_DIR/bin/openwrt-sw-probe-ATLAS.sh" \
    "$SCRIPTS_DIR/bin/openwrt-sw-probe-reginit.sh" \
    "$SCRIPTS_DIR/bin/arch/openwrt-sw-probe/openwrt-sw-probe-ATLAS.sh" \
    "$SCRIPTS_DIR/bin/arch/openwrt-sw-probe/openwrt-sw-probe-common.sh" \
    "$SCRIPTS_DIR/bin/arch/linux/linux-functions.sh" \
    "$SCRIPTS_DIR/state/FIRMWARE_APPS_VERSION" \
    "$SCRIPTS_DIR/state/mode" \
    "$SCRIPTS_DIR/state/config.txt" \
    "$SCRIPTS_DIR/etc/known_hosts.reg" \
    "$SCRIPTS_DIR/etc/reg_servers.sh.prod"
do
    [ -e "$f" ] || { echo "Missing: $f"; exit 1; }
done

# Check firmware version matches PKG_VERSION
version=$(cat "$SCRIPTS_DIR/state/FIRMWARE_APPS_VERSION")
[ "$version" = "5120" ] || { echo "Unexpected version: $version"; exit 1; }

# Check probe mode is prod
mode=$(cat "$SCRIPTS_DIR/state/mode")
[ "$mode" = "prod" ] || { echo "Unexpected mode: $mode"; exit 1; }

# Check RXTXRPT is enabled
grep -q "RXTXRPT=yes" "$SCRIPTS_DIR/state/config.txt" \
    || { echo "RXTXRPT=yes not found in config.txt"; exit 1; }

# Check probe type is set correctly in config.sh
grep -q "PROBE_TYPE=openwrt-sw-probe" "$SCRIPTS_DIR/bin/config.sh" \
    || { echo "PROBE_TYPE=openwrt-sw-probe not found in config.sh"; exit 1; }

# Check measurement dir is referenced correctly in paths.lib.sh
grep -q "ATLAS_MEASUREMENT=/usr/libexec/atlas-probe/bin" "$SCRIPTS_DIR/bin/paths.lib.sh" \
    || { echo "ATLAS_MEASUREMENT path wrong in paths.lib.sh"; exit 1; }

echo "atlas-sw-probe OK"
