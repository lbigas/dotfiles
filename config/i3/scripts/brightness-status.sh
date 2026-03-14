#!/usr/bin/env bash
set -u

have_i2c_access() {
    for dev in /dev/i2c-*; do
        [ -e "$dev" ] || continue
        [ -r "$dev" ] && [ -w "$dev" ] && return 0
    done

    return 1
}

parse_values() {
    awk '
        /^VCP/ && NF >= 4 {
            current = $(NF - 1)
            max = $NF
        }

        /current value[[:space:]]*=/ {
            line = $0
            sub(/^.*current value[[:space:]]*=[[:space:]]*/, "", line)
            split(line, parts, /,[[:space:]]*max value[[:space:]]*=[[:space:]]*/)
            gsub(/[^0-9]/, "", parts[1])
            gsub(/[^0-9]/, "", parts[2])
            current = parts[1]
            max = parts[2]
        }

        END {
            if (current != "" && max != "") {
                print current, max
            }
        }
    '
}

command -v ddcutil >/dev/null 2>&1 || {
    printf 'BRI n/a\n'
    exit 0
}

have_i2c_access || {
    printf 'BRI n/a\n'
    exit 0
}

output="$(ddcutil --brief getvcp 10 2>/dev/null || true)"
[ -n "$output" ] || output="$(ddcutil getvcp 10 2>/dev/null || true)"
[ -n "$output" ] || {
    printf 'BRI n/a\n'
    exit 0
}

values="$(printf '%s\n' "$output" | parse_values)"
[ -n "$values" ] || {
    printf 'BRI n/a\n'
    exit 0
}

set -- $values
current="$1"
max="$2"

[ "$max" -gt 0 ] 2>/dev/null || {
    printf 'BRI n/a\n'
    exit 0
}

percent=$(( (current * 100 + max / 2) / max ))
printf 'BRI %s%%\n' "$percent"
