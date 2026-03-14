#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

start_once() {
    if command -v "$1" >/dev/null 2>&1 && ! pgrep -u "$USER" -x "$1" >/dev/null 2>&1; then
        "$@" >/dev/null 2>&1 &
    fi
}

if command -v dex-autostart >/dev/null 2>&1 && ! pgrep -u "$USER" -f 'dex-autostart --autostart --environment i3' >/dev/null 2>&1; then
    dex-autostart --autostart --environment i3 >/dev/null 2>&1 &
fi

start_once dunst dunst
start_once nm-applet nm-applet

if command -v blueman-applet >/dev/null 2>&1 && ! pgrep -u "$USER" -f blueman-applet >/dev/null 2>&1; then
    blueman-applet >/dev/null 2>&1 &
fi

if command -v xss-lock >/dev/null 2>&1 && ! pgrep -u "$USER" -f 'xss-lock.*lock.sh' >/dev/null 2>&1; then
    xss-lock --transfer-sleep-lock -- "$HOME/.config/i3/scripts/lock.sh" >/dev/null 2>&1 &
fi

if [ -x /usr/libexec/lxqt-policykit-agent ] && ! pgrep -u "$USER" -f lxqt-policykit-agent >/dev/null 2>&1; then
    /usr/libexec/lxqt-policykit-agent >/dev/null 2>&1 &
fi
