#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

menu() {
    printf '%s\n' \
        "Lock" \
        "Suspend" \
        "Logout" \
        "Reboot" \
        "Shutdown"
}

choice="$(menu | rofi -dmenu -i -p power)"
[ -n "${choice:-}" ] || exit 0

case "$choice" in
    Lock)
        exec "$HOME/.config/i3/scripts/lock.sh"
        ;;
    Suspend)
        "$HOME/.config/i3/scripts/lock.sh" &
        sleep 0.2
        exec systemctl suspend
        ;;
    Logout)
        exec i3-msg exit
        ;;
    Reboot)
        exec systemctl reboot
        ;;
    Shutdown)
        exec systemctl poweroff
        ;;
esac
