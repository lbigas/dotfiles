#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

start_bg() {
    "$@" >/dev/null 2>&1 &
}

start_once() {
    if command -v "$1" >/dev/null 2>&1 && ! pgrep -u "$USER" -x "$1" >/dev/null 2>&1; then
        start_bg "$@"
    fi
}

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP=i3 >/dev/null 2>&1 || true
fi

if command -v dex-autostart >/dev/null 2>&1 && ! pgrep -u "$USER" -f 'dex-autostart --autostart --environment i3' >/dev/null 2>&1; then
    start_bg dex-autostart --autostart --environment i3
fi

start_once dunst dunst
start_once nm-applet nm-applet

if command -v blueman-applet >/dev/null 2>&1 && ! pgrep -u "$USER" -f blueman-applet >/dev/null 2>&1; then
    start_bg blueman-applet
fi

if command -v xss-lock >/dev/null 2>&1 && ! pgrep -u "$USER" -f 'xss-lock.*lock.sh' >/dev/null 2>&1; then
    start_bg xss-lock --transfer-sleep-lock -- "$HOME/.config/i3/scripts/lock.sh"
fi

if [ -x /usr/libexec/lxqt-policykit-agent ] && ! pgrep -u "$USER" -f lxqt-policykit-agent >/dev/null 2>&1; then
    start_bg /usr/libexec/lxqt-policykit-agent
fi
