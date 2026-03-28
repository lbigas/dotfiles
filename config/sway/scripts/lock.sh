#!/usr/bin/env bash
set -u

if command -v swaylock >/dev/null 2>&1; then
    exec swaylock -f -c 1f2335
fi

if command -v i3lock >/dev/null 2>&1; then
    exec i3lock -e -n -c 1f2335
fi

if command -v notify-send >/dev/null 2>&1; then
    notify-send -a sway "Lock" "Install swaylock to lock the Sway session"
fi

exit 1
