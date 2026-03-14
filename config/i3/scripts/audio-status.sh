#!/usr/bin/env bash
set -u

if command -v wpctl >/dev/null 2>&1; then
    output="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null || true)"
    if [ -n "$output" ]; then
        percent="$(printf '%s\n' "$output" | awk '{printf "%d", $2 * 100}')"
        if printf '%s\n' "$output" | grep -q '\[MUTED\]'; then
            printf 'VOL mute\n'
        else
            printf 'VOL %s%%\n' "$percent"
        fi
        exit 0
    fi
fi

if command -v pactl >/dev/null 2>&1; then
    percent="$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | awk -F'/' 'NR==1 {gsub(/ /, "", $2); print $2}')"
    muted="$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')"
    if [ -n "$percent" ]; then
        if [ "$muted" = "yes" ]; then
            printf 'VOL mute\n'
        else
            printf 'VOL %s\n' "$percent"
        fi
        exit 0
    fi
fi

printf 'VOL n/a\n'
