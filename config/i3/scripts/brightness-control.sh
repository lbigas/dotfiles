#!/usr/bin/env bash
set -u

status_script="$HOME/.config/i3/scripts/brightness-status.sh"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a i3 -h string:x-dunst-stack-tag:brightness "Brightness" "$1"
    fi
}

have_i2c_access() {
    for dev in /dev/i2c-*; do
        [ -e "$dev" ] || continue
        [ -r "$dev" ] && [ -w "$dev" ] && return 0
    done

    return 1
}

show_status() {
    "$status_script" 2>/dev/null || true
}

change_brightness() {
    direction="$1"

    command -v ddcutil >/dev/null 2>&1 || {
        notify "Brightness control unavailable"
        exit 1
    }

    have_i2c_access || {
        notify "Brightness unavailable: DDC permissions are not active yet"
        exit 1
    }

    if ddcutil setvcp 10 "$direction" 5 >/dev/null 2>&1; then
        notify "$(show_status)"
    else
        notify "Failed to change brightness"
        exit 1
    fi
}

case "${1:-}" in
    --up)
        change_brightness +
        ;;
    --down)
        change_brightness -
        ;;
    *)
        notify "$(show_status)"
        ;;
esac
