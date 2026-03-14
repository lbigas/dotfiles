#!/usr/bin/env bash
set -u

script_dir="$HOME/.config/i3/scripts"

json_escape() {
    printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

module_block() {
    name="$1"
    color="$2"
    output="$("$script_dir/${name}-status.sh" 2>/dev/null || true)"
    [ -n "$output" ] || return 0

    printf '{"name":"%s","full_text":"%s","color":"%s"}' "$name" "$(json_escape "$output")" "$color"
}

prefix_modules() {
    output=""

    for item in \
        "$(module_block network '#88c0d0')" \
        "$(module_block bluetooth '#a3be8c')" \
        "$(module_block audio '#ebcb8b')"
    do
        [ -n "$item" ] || continue
        if [ -n "$output" ]; then
            output="${output},${item}"
        else
            output="$item"
        fi
    done

    printf '%s' "$output"
}

i3status --config "$HOME/.config/i3status/config" | while IFS= read -r line; do
    case "$line" in
        '{"version":'*|'['|']')
            printf '%s\n' "$line"
            ;;
        ',['*)
            prefix="$(prefix_modules)"
            if [ -n "$prefix" ]; then
                printf ',[%s,%s\n' "$prefix" "${line:2}"
            else
                printf '%s\n' "$line"
            fi
            ;;
        '['*)
            prefix="$(prefix_modules)"
            if [ -n "$prefix" ]; then
                printf '[%s,%s\n' "$prefix" "${line:1}"
            else
                printf '%s\n' "$line"
            fi
            ;;
        *)
            printf '%s\n' "$line"
            ;;
    esac
done
