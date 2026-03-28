#!/usr/bin/env bash
set -u

cache_dir="$HOME/.cache/sway"
state_file="$cache_dir/caffeine.pid"

notify_state() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a sway "Caffeine" "$1"
    fi
}

find_swayidle_pid() {
    pgrep -u "$USER" -x swayidle | head -n1
}

if ! command -v swayidle >/dev/null 2>&1; then
    notify_state "Caffeine unavailable: install swayidle first"
    exit 1
fi

if [ -f "$state_file" ]; then
    pid="$(cat "$state_file" 2>/dev/null || true)"
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
        kill -CONT "$pid"
        rm -f "$state_file"
        swaymsg "output * dpms on" >/dev/null 2>&1 || true
        notify_state "Screen blanking restored"
        exit 0
    fi

    rm -f "$state_file"
fi

pid="$(find_swayidle_pid)"
[ -n "$pid" ] || {
    notify_state "Caffeine unavailable: swayidle is not running"
    exit 1
}

mkdir -p "$cache_dir"
printf '%s\n' "$pid" >"$state_file"
kill -STOP "$pid"
swaymsg "output * dpms on" >/dev/null 2>&1 || true
notify_state "Screen blanking disabled"
