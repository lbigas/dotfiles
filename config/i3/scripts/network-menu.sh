#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

tab="$(printf '\t')"
menu_cmd="$HOME/.config/i3/scripts/menu.sh"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a i3 "Network" "$1"
    fi
}

wifi_device() {
    nmcli -t -f DEVICE,TYPE device status 2>/dev/null | awk -F: '$2 == "wifi" { print $1; exit }'
}

current_status() {
    "$HOME/.config/i3/scripts/network-status.sh" 2>/dev/null || true
}

toggle_wifi() {
    state="$(nmcli radio wifi 2>/dev/null | tr '[:upper:]' '[:lower:]' | head -n1)"
    if [ "$state" = "enabled" ]; then
        nmcli radio wifi off && notify "Wi-Fi disabled"
    else
        nmcli radio wifi on && notify "Wi-Fi enabled"
    fi
}

connect_wifi() {
    device="$(wifi_device)"
    [ -n "$device" ] || {
        notify "No Wi-Fi device found"
        exit 1
    }

    networks="$(
        nmcli -t -f ACTIVE,SIGNAL,SECURITY,SSID device wifi list ifname "$device" --rescan yes 2>/dev/null |
            while IFS=: read -r active signal security ssid; do
                [ -n "$ssid" ] || continue
                [ "$security" = "--" ] && security="open"
                marker="  "
                [ "$active" = "yes" ] && marker="* "
                printf '%s%s%s%s%% %s\n' "$ssid" "$tab" "$marker" "$signal" "$security"
            done
    )"

    [ -n "$networks" ] || {
        notify "No Wi-Fi networks found"
        exit 1
    }

    choice="$(printf '%s\n' "$networks" | "$menu_cmd" --prompt wifi)"
    [ -n "${choice:-}" ] || exit 0

    ssid="${choice%%"$tab"*}"
    security="$(
        nmcli -t -f ACTIVE,SIGNAL,SECURITY,SSID device wifi list ifname "$device" --rescan no 2>/dev/null |
            while IFS=: read -r active signal current_security current_ssid; do
                if [ "$current_ssid" = "$ssid" ]; then
                    printf '%s\n' "$current_security"
                    break
                fi
            done
    )"

    if [ -z "$security" ] || [ "$security" = "--" ]; then
        if nmcli device wifi connect "$ssid" ifname "$device"; then
            notify "Connected to $ssid"
        else
            notify "Failed to connect to $ssid"
        fi
        exit 0
    fi

    password="$(printf '' | "$menu_cmd" --password --prompt "password for $ssid")"
    [ -n "${password:-}" ] || exit 0

    if nmcli device wifi connect "$ssid" password "$password" ifname "$device"; then
        notify "Connected to $ssid"
    else
        notify "Failed to connect to $ssid"
    fi
}

saved_connections() {
    connections="$(
        nmcli -t -f TYPE,NAME connection show 2>/dev/null |
            while IFS=: read -r type name; do
                case "$type" in
                    802-11-wireless|vpn|ethernet)
                        printf '%s%s%s\n' "$name" "$tab" "$type"
                        ;;
                esac
            done
    )"

    [ -n "$connections" ] || {
        notify "No saved connections"
        exit 1
    }

    choice="$(printf '%s\n' "$connections" | "$menu_cmd" --prompt saved)"
    [ -n "${choice:-}" ] || exit 0

    name="${choice%%"$tab"*}"
    if nmcli connection up id "$name"; then
        notify "Activated $name"
    else
        notify "Failed to activate $name"
    fi
}

disconnect_current() {
    device="$(
        nmcli -t -f DEVICE,TYPE,STATE device status 2>/dev/null | awk -F: '
            ($2 == "wifi" || $2 == "ethernet") && $3 == "connected" {
                print $1
                exit
            }
        '
    )"

    [ -n "$device" ] || {
        notify "No active network connection"
        exit 1
    }

    if nmcli device disconnect "$device"; then
        notify "Disconnected $device"
    else
        notify "Failed to disconnect $device"
    fi
}

open_editor() {
    if command -v nm-connection-editor >/dev/null 2>&1; then
        exec nm-connection-editor
    fi

    notify "nm-connection-editor is not installed"
}

open_nmtui() {
    if command -v nmtui >/dev/null 2>&1; then
        exec wezterm start -- nmtui
    fi

    notify "nmtui is not installed"
}

menu_items() {
    printf '%s\n' \
        "Toggle Wi-Fi" \
        "Connect Wi-Fi" \
        "Saved connections" \
        "Disconnect current" \
        "Edit connections" \
        "Open nmtui"
}

choice="$(menu_items | "$menu_cmd" --prompt "$(current_status)")"
[ -n "${choice:-}" ] || exit 0

case "$choice" in
    "Toggle Wi-Fi")
        toggle_wifi
        ;;
    "Connect Wi-Fi")
        connect_wifi
        ;;
    "Saved connections")
        saved_connections
        ;;
    "Disconnect current")
        disconnect_current
        ;;
    "Edit connections")
        open_editor
        ;;
    "Open nmtui")
        open_nmtui
        ;;
esac
