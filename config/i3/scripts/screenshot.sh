#!/usr/bin/env bash
set -u

shots_dir="$HOME/Pictures/Screenshots"
timestamp="$(date +%Y-%m-%d_%H-%M-%S)"
outfile="$shots_dir/screenshot_$timestamp.png"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a i3 "Screenshot" "$1"
    fi
}

need_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        notify "Missing command: $1"
        exit 1
    }
}

save_area() {
    need_cmd flameshot
    mkdir -p "$shots_dir"
    if flameshot gui -p "$outfile"; then
        notify "Saved $outfile"
    fi
}

copy_area() {
    need_cmd flameshot
    if flameshot gui -c; then
        notify "Copied selection to clipboard"
    fi
}

save_full() {
    need_cmd flameshot
    mkdir -p "$shots_dir"
    if flameshot full -p "$outfile"; then
        notify "Saved $outfile"
    fi
}

case "${1:-}" in
    --area-save)
        save_area
        ;;
    --area-copy)
        copy_area
        ;;
    --full-save)
        save_full
        ;;
    *)
        printf 'usage: %s [--area-save|--area-copy|--full-save]\n' "$0" >&2
        exit 2
        ;;
esac
