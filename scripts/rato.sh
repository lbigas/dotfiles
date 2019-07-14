#!/bin/bash
var=$(xinput list | grep "USB Optical Mouse" | awk '{print ($6)}' | awk -F '[^0-9]+' '{OFS=" "; for(i=1; i<=NF; ++i) if ($i != "") print($i)}')

xinput set-prop $var "Device Accel Profile" -1
xinput set-prop $var "Device Accel Constant Deceleration" 1

echo "Mouse accel disabled, speed set to 1"
