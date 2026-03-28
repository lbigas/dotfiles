#!/usr/bin/env bash
set -u

. "$HOME/.config/sway/scripts/dark-env.sh"

menu() {
    printf '%s\n' \
        "Lock" \
        "Suspend" \
        "Logout" \
        "Reboot" \
        "Shutdown"
}

choice="$(menu | "$HOME/.config/sway/scripts/menu.sh" --prompt power)"
[ -n "${choice:-}" ] || exit 0

case "$choice" in
    Lock)
        exec "$HOME/.config/sway/scripts/lock.sh"
        ;;
    Suspend)
        "$HOME/.config/sway/scripts/lock.sh" &
        sleep 0.2
        exec systemctl suspend
        ;;
    Logout)
        exec swaymsg exit
        ;;
    Reboot)
        exec systemctl reboot
        ;;
    Shutdown)
        exec systemctl poweroff
        ;;
esac
