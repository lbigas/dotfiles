#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

tab="$(printf '\t')"
menu_cmd="$HOME/.config/i3/scripts/menu.sh"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a i3 "Bluetooth" "$1"
    fi
}

current_status() {
    "$HOME/.config/i3/scripts/bluetooth-status.sh" 2>/dev/null || true
}

power_state() {
    bluetoothctl show 2>/dev/null | awk '/Powered:/ {print $2; exit}'
}

toggle_power() {
    if [ "$(power_state)" = "yes" ]; then
        bluetoothctl power off && notify "Bluetooth disabled"
    else
        bluetoothctl power on && notify "Bluetooth enabled"
    fi
}

device_lines() {
    bluetoothctl "$@" 2>/dev/null | while IFS= read -r line; do
        [ -n "$line" ] || continue
        line="${line#Device }"
        mac="${line%% *}"
        name="${line#"$mac "}"
        [ "$name" = "$line" ] && name="$mac"
        printf '%s%s%s\n' "$mac" "$tab" "$name"
    done
}

connect_paired() {
    devices="$(device_lines devices Paired)"
    [ -n "$devices" ] || {
        notify "No paired Bluetooth devices"
        exit 1
    }

    choice="$(printf '%s\n' "$devices" | "$menu_cmd" --prompt paired)"
    [ -n "${choice:-}" ] || exit 0

    mac="${choice%%"$tab"*}"
    name="${choice#*"$tab"}"

    if bluetoothctl connect "$mac"; then
        notify "Connected to $name"
    else
        notify "Failed to connect to $name"
    fi
}

disconnect_connected() {
    devices="$(device_lines devices Connected)"
    [ -n "$devices" ] || {
        notify "No connected Bluetooth devices"
        exit 1
    }

    choice="$(printf '%s\n' "$devices" | "$menu_cmd" --prompt connected)"
    [ -n "${choice:-}" ] || exit 0

    mac="${choice%%"$tab"*}"
    name="${choice#*"$tab"}"

    if bluetoothctl disconnect "$mac"; then
        notify "Disconnected $name"
    else
        notify "Failed to disconnect $name"
    fi
}

pair_new() {
    notify "Scanning for Bluetooth devices"
    bluetoothctl --timeout 8 scan on >/dev/null 2>&1

    devices="$(device_lines devices)"
    [ -n "$devices" ] || {
        notify "No Bluetooth devices found"
        exit 1
    }

    choice="$(printf '%s\n' "$devices" | "$menu_cmd" --prompt discover)"
    [ -n "${choice:-}" ] || exit 0

    mac="${choice%%"$tab"*}"
    name="${choice#*"$tab"}"

    if bluetoothctl pair "$mac" && bluetoothctl trust "$mac" && bluetoothctl connect "$mac"; then
        notify "Paired and connected $name"
    else
        notify "Failed to pair $name"
    fi
}

remove_paired() {
    devices="$(device_lines devices Paired)"
    [ -n "$devices" ] || {
        notify "No paired Bluetooth devices"
        exit 1
    }

    choice="$(printf '%s\n' "$devices" | "$menu_cmd" --prompt remove)"
    [ -n "${choice:-}" ] || exit 0

    mac="${choice%%"$tab"*}"
    name="${choice#*"$tab"}"

    if bluetoothctl remove "$mac"; then
        notify "Removed $name"
    else
        notify "Failed to remove $name"
    fi
}

open_manager() {
    if command -v blueman-manager >/dev/null 2>&1; then
        exec blueman-manager
    fi

    notify "blueman-manager is not installed"
}

menu_items() {
    printf '%s\n' \
        "Toggle Bluetooth" \
        "Connect paired device" \
        "Disconnect device" \
        "Pair new device" \
        "Remove paired device" \
        "Open blueman-manager"
}

choice="$(menu_items | "$menu_cmd" --prompt "$(current_status)")"
[ -n "${choice:-}" ] || exit 0

case "$choice" in
    "Toggle Bluetooth")
        toggle_power
        ;;
    "Connect paired device")
        connect_paired
        ;;
    "Disconnect device")
        disconnect_connected
        ;;
    "Pair new device")
        pair_new
        ;;
    "Remove paired device")
        remove_paired
        ;;
    "Open blueman-manager")
        open_manager
        ;;
esac
