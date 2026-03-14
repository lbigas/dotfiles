#!/usr/bin/env bash
set -u

cache_dir="$HOME/.cache/i3"
state_file="$cache_dir/caffeine.state"

notify_state() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send -a i3 "Caffeine" "$1"
    fi
}

status="$(xset q 2>/dev/null || true)"
[ -n "$status" ] || exit 1

screen_timeout="$(printf '%s\n' "$status" | awk '/^[[:space:]]*timeout:/ {print $2; exit}')"
screen_cycle="$(printf '%s\n' "$status" | awk '/^[[:space:]]*timeout:/ {print $4; exit}')"
dpms_state="$(printf '%s\n' "$status" | awk '/DPMS is/ {print $3; exit}')"
dpms_times="$(printf '%s\n' "$status" | awk '/^[[:space:]]*Standby:/ {print $2, $4, $6; exit}')"

set -- $dpms_times
standby="${1:-600}"
suspend="${2:-600}"
off="${3:-600}"

if [ "${screen_timeout:-}" = "0" ] || [ "${dpms_state:-Enabled}" = "Disabled" ]; then
    if [ -f "$state_file" ]; then
        # shellcheck disable=SC1090
        . "$state_file"
    fi

    xset s "${screen_timeout_restore:-600}" "${screen_cycle_restore:-600}"

    if [ "${dpms_enabled_restore:-1}" = "1" ]; then
        xset +dpms
        xset dpms "${standby_restore:-600}" "${suspend_restore:-600}" "${off_restore:-600}"
    else
        xset -dpms
    fi

    rm -f "$state_file"
    notify_state "Screen blanking restored"
    exit 0
fi

mkdir -p "$cache_dir"
cat >"$state_file" <<EOF
screen_timeout_restore=${screen_timeout:-600}
screen_cycle_restore=${screen_cycle:-600}
standby_restore=${standby}
suspend_restore=${suspend}
off_restore=${off}
dpms_enabled_restore=$( [ "${dpms_state:-Enabled}" = "Enabled" ] && printf '1' || printf '0' )
EOF

xset s off
xset -dpms
notify_state "Screen blanking disabled"
