#!/usr/bin/env bash
set -u

pkill -x waybar >/dev/null 2>&1 || true
env GDK_BACKEND=wayland DISPLAY= waybar >/dev/null 2>&1 &
