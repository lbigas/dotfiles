#!/bin/bash

chosen=$(echo -e "[Cancel]\nus\nus-altgr-intl\ngb\ngb-extd" | rofi -dmenu -i)

setxkbmap -layout us -variant altgr-intl
# if [[ $chosen = "Logout" ]]; then
# 	jwm -exit
if [[ $chosen = "us" ]]; then
	setxkbmap -layout us
elif [[ $chosen = "us-altgr-intl" ]]; then
    setxkbmap -layout us -variant altgr-intl	
elif [[ $chosen = "gb" ]]; then
    setxkbmap -layout gb
elif [[ $chosen = "gb-extd" ]]; then
    setxkbmap -layout gb -variant extd	
fi
