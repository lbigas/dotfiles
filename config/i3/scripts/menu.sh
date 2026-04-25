#!/usr/bin/env bash
set -u

. "$HOME/.config/i3/scripts/dark-env.sh"

prompt=""
password=0
drun=0

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
        --drun)
            drun=1
            shift
            ;;
        *)
            printf 'Unknown option: %s\n' "$1" >&2
            exit 2
            ;;
    esac
done

if ! command -v rofi >/dev/null 2>&1; then
    printf 'rofi is not installed\n' >&2
    exit 1
fi

if [ "$drun" -eq 1 ]; then
    if [ -n "$prompt" ]; then
        exec rofi -show drun -matching fuzzy -sort -sorting-method fzf -kb-cancel Escape -display-drun "$prompt"
    fi

    exec rofi -show drun -matching fuzzy -sort -sorting-method fzf -kb-cancel Escape
fi

if [ "$password" -eq 1 ]; then
    exec rofi -dmenu -i -password -p "$prompt"
fi

exec rofi -dmenu -i -p "$prompt"
