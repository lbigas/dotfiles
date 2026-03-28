#!/usr/bin/env bash
set -u

shots_dir="$HOME/Pictures/Screenshots"
timestamp="$(date +%Y-%m-%d_%H-%M-%S)"
outfile="$shots_dir/screenshot_$timestamp.png"

notify() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a sway "Screenshot" "$1"
    fi
}

need_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        notify "Missing command: $1"
        exit 1
    }
}

save_area() {
    need_cmd grim
    need_cmd slurp
    mkdir -p "$shots_dir"
    geometry="$(slurp)"
    [ -n "${geometry:-}" ] || exit 0
    grim -g "$geometry" "$outfile"
    notify "Saved $outfile"
}

copy_area() {
    need_cmd grim
    need_cmd slurp
    need_cmd wl-copy
    geometry="$(slurp)"
    [ -n "${geometry:-}" ] || exit 0
    grim -g "$geometry" - | wl-copy
    notify "Copied selection to clipboard"
}

save_full() {
    need_cmd grim
    mkdir -p "$shots_dir"
    grim "$outfile"
    notify "Saved $outfile"
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
