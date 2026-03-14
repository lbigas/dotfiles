#!/usr/bin/env bash
set -u

pkill -x polybar >/dev/null 2>&1 || true

while pgrep -x polybar >/dev/null 2>&1; do
    sleep 0.2
done

exec polybar main
