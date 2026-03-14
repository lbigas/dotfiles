#!/usr/bin/env bash
set -u

if ! command -v xset >/dev/null 2>&1; then
    printf 'CAFFEINE n/a\n'
    exit 0
fi

status="$(xset q 2>/dev/null || true)"
[ -n "$status" ] || {
    printf 'CAFFEINE n/a\n'
    exit 0
}

timeout_value="$(printf '%s\n' "$status" | awk '/^[[:space:]]*timeout:/ {print $2; exit}')"
dpms_state="$(printf '%s\n' "$status" | awk '/DPMS is/ {print $3; exit}')"

if [ "${timeout_value:-}" = "0" ] || [ "${dpms_state:-Enabled}" = "Disabled" ]; then
    printf 'CAFFEINE on\n'
else
    printf 'CAFFEINE off\n'
fi
