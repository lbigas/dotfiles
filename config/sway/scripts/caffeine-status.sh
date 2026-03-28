#!/usr/bin/env bash
set -u

state_file="$HOME/.cache/sway/caffeine.pid"

if ! command -v swayidle >/dev/null 2>&1; then
    printf 'CAFFEINE n/a\n'
    exit 0
fi

if [ -f "$state_file" ]; then
    pid="$(cat "$state_file" 2>/dev/null || true)"
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
        printf 'CAFFEINE on\n'
        exit 0
    fi

    rm -f "$state_file"
fi

if pgrep -u "$USER" -x swayidle >/dev/null 2>&1; then
    printf 'CAFFEINE off\n'
else
    printf 'CAFFEINE n/a\n'
fi
