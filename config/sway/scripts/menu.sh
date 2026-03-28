#!/usr/bin/env bash
set -u

. "$HOME/.config/sway/scripts/dark-env.sh"

prompt=""
password=0

while [ "$#" -gt 0 ]; do
    case "$1" in
        --prompt)
            prompt="${2:-}"
            shift 2
            ;;
        --password)
            password=1
            shift
            ;;
        *)
            printf 'Unknown option: %s\n' "$1" >&2
            exit 2
            ;;
    esac
done

if command -v wofi >/dev/null 2>&1; then
    if [ "$password" -eq 1 ]; then
        exec wofi --dmenu --prompt "$prompt" --insensitive --password
    fi

    exec wofi --dmenu --prompt "$prompt" --insensitive
fi

if command -v rofi >/dev/null 2>&1; then
    if [ "$password" -eq 1 ]; then
        exec rofi -dmenu -i -password -p "$prompt"
    fi

    exec rofi -dmenu -i -p "$prompt"
fi

printf 'No menu launcher found\n' >&2
exit 1
