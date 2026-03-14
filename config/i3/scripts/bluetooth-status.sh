#!/usr/bin/env bash
set -u

command -v bluetoothctl >/dev/null 2>&1 || exit 0

show_output="$(bluetoothctl show 2>/dev/null || true)"
[ -n "$show_output" ] || exit 0

powered="$(printf '%s\n' "$show_output" | awk '/Powered:/ {print $2; exit}')"

if [ "$powered" != "yes" ]; then
    printf 'BT off\n'
    exit 0
fi

connected_devices="$(bluetoothctl devices Connected 2>/dev/null | sed 's/^Device [^ ]* //')"
count="$(printf '%s\n' "$connected_devices" | awk 'NF {count++} END {print count + 0}')"

case "$count" in
    0)
        printf 'BT on\n'
        ;;
    1)
        printf 'BT %s\n' "$(printf '%s\n' "$connected_devices" | head -n1)"
        ;;
    *)
        printf 'BT %s devices\n' "$count"
        ;;
esac
