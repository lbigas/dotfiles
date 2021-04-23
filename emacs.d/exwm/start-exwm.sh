#!/bin/sh

setxkbmap gb &
nm-applet &
exec dbus-launch --exit-with-session emacs -mm --debug-init
# exec dbus-launch --exit-with-session emacs --debug-init
# exec dbus-launch --exit-with-session emacs --debug-init
# exec emacs
