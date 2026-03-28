#!/usr/bin/env bash
set -u

. "$HOME/.config/sway/scripts/dark-env.sh"

menu_cmd="$HOME/.config/sway/scripts/menu.sh"
status_script="$HOME/.config/i3/scripts/audio-status.sh"

audio_status() {
    "$status_script" 2>/dev/null || true
}

notify_volume() {
    status="$(audio_status)"

    if ! command -v notify-send >/dev/null 2>&1; then
        return 0
    fi

    case "$status" in
        "VOL mute")
            notify-send -a sway \
                -h string:x-dunst-stack-tag:volume \
                -h int:value:0 \
                "Volume" "Muted"
            ;;
        VOL\ *)
            level="${status#VOL }"
            percent="$(printf '%s' "$level" | tr -cd '0-9')"
            if [ -n "$percent" ]; then
                notify-send -a sway \
                    -h string:x-dunst-stack-tag:volume \
                    -h int:value:"$percent" \
                    "Volume" "$level"
            else
                notify-send -a sway \
                    -h string:x-dunst-stack-tag:volume \
                    "Volume" "$level"
            fi
            ;;
        *)
            notify-send -a sway \
                -h string:x-dunst-stack-tag:volume \
                "Volume" "$status"
            ;;
    esac
}

notify_mic() {
    if ! command -v notify-send >/dev/null 2>&1; then
        return 0
    fi

    if command -v wpctl >/dev/null 2>&1; then
        if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null | grep -q '\[MUTED\]'; then
            notify-send -a sway -h string:x-dunst-stack-tag:mic "Mic" "Muted"
        else
            notify-send -a sway -h string:x-dunst-stack-tag:mic "Mic" "Unmuted"
        fi
        return 0
    fi

    if command -v pactl >/dev/null 2>&1; then
        muted="$(pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | awk '{print $2}')"
        if [ "$muted" = "yes" ]; then
            notify-send -a sway -h string:x-dunst-stack-tag:mic "Mic" "Muted"
        else
            notify-send -a sway -h string:x-dunst-stack-tag:mic "Mic" "Unmuted"
        fi
    fi
}

volume_up() {
    if command -v wpctl >/dev/null 2>&1; then
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
    else
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    fi
    notify_volume
}

volume_down() {
    if command -v wpctl >/dev/null 2>&1; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    else
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    fi
    notify_volume
}

toggle_mute() {
    if command -v wpctl >/dev/null 2>&1; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    else
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    fi
    notify_volume
}

toggle_mic_mute() {
    if command -v wpctl >/dev/null 2>&1; then
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    else
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
    fi
    notify_mic
}

case "${1:-}" in
    --up)
        volume_up
        exit 0
        ;;
    --down)
        volume_down
        exit 0
        ;;
    --mute)
        toggle_mute
        exit 0
        ;;
    --mic-mute)
        toggle_mic_mute
        exit 0
        ;;
esac

menu_items() {
    printf '%s\n' \
        "Volume +5%" \
        "Volume -5%" \
        "Toggle mute" \
        "Toggle mic mute"

    if command -v pavucontrol >/dev/null 2>&1; then
        printf '%s\n' "Open pavucontrol"
    fi
}

choice="$(menu_items | "$menu_cmd" --prompt "$(audio_status)")"
[ -n "${choice:-}" ] || exit 0

case "$choice" in
    "Volume +5%")
        volume_up
        ;;
    "Volume -5%")
        volume_down
        ;;
    "Toggle mute")
        toggle_mute
        ;;
    "Toggle mic mute")
        toggle_mic_mute
        ;;
    "Open pavucontrol")
        exec pavucontrol
        ;;
esac
