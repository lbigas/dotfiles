#!/usr/bin/env bash
set -u

. "$HOME/.config/sway/scripts/dark-env.sh"

start_bg() {
    "$@" >/dev/null 2>&1 &
}

start_once() {
    if command -v "$1" >/dev/null 2>&1 && ! pgrep -u "$USER" -x "$1" >/dev/null 2>&1; then
        start_bg "$@"
    fi
}

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP=sway >/dev/null 2>&1 || true
fi

if command -v dex-autostart >/dev/null 2>&1 && ! pgrep -u "$USER" -f 'dex-autostart --autostart --environment sway' >/dev/null 2>&1; then
    start_bg dex-autostart --autostart --environment sway
fi

start_once dunst dunst
start_once nm-applet nm-applet

if command -v blueman-applet >/dev/null 2>&1 && ! pgrep -u "$USER" -f blueman-applet >/dev/null 2>&1; then
    start_bg blueman-applet
fi

if [ -x /usr/libexec/lxqt-policykit-agent ] && ! pgrep -u "$USER" -f lxqt-policykit-agent >/dev/null 2>&1; then
    start_bg /usr/libexec/lxqt-policykit-agent
fi

if command -v swayidle >/dev/null 2>&1 && ! pgrep -u "$USER" -x swayidle >/dev/null 2>&1; then
    start_bg swayidle -w \
        timeout 600 "$HOME/.config/sway/scripts/lock.sh" \
        timeout 660 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
        before-sleep "$HOME/.config/sway/scripts/lock.sh"
fi
