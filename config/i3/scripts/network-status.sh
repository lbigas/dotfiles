#!/usr/bin/env bash
set -u

command -v nmcli >/dev/null 2>&1 || {
    printf 'NET n/a\n'
    exit 0
}

connected_line="$(
    nmcli -t -f DEVICE,TYPE,STATE,CONNECTION device status 2>/dev/null | awk -F: '
        $2 == "wifi" && $3 == "connected" {
            print
            exit
        }
        $2 == "ethernet" && $3 == "connected" && wired == "" {
            wired = $0
        }
        END {
            if (wired != "") {
                print wired
            }
        }
    '
)"

if [ -n "$connected_line" ]; then
    IFS=: read -r device type state connection <<<"$connected_line"
    case "$type" in
        wifi)
            printf 'NET %s\n' "$connection"
            ;;
        ethernet)
            printf 'NET wired\n'
            ;;
        *)
            printf 'NET %s\n' "$connection"
            ;;
    esac
    exit 0
fi

wifi_state="$(nmcli radio wifi 2>/dev/null | tr '[:upper:]' '[:lower:]' | head -n1)"

case "$wifi_state" in
    enabled)
        printf 'NET offline\n'
        ;;
    disabled)
        printf 'NET wifi off\n'
        ;;
    *)
        printf 'NET n/a\n'
        ;;
esac
