#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


########################Dwm#########################
#while true
#do
#	if [[ $(< /proc/acpi/button/lid/LID/state) = *closed ]]
#	then
#		logger Lid closed
#        if( $(< /sys/class/power_supply/AC/online) )
#		    logger "suspending..."; systemctl suspend ;;
#		esac
#	fi
#	sleep 2
#done &

#xautolock -time 1 -locker slock &

feh --bg-scale ~/Media/wallpapers/walp1.jpg
setxkbmap -layout gb &
~/.scripts/slstatus &
#exec xfce4-power-manager &
exec dwm
####################################################

#session=${1:-xfce}
#
#case $1 in
#    dwm        )
#        while true; do xsetroot -name "$(awk '{sum+=$1}END{print sum}' /sys/class/power_supply/BAT0/capacity) $(awk '{sum+=$1}END{print sum}' /sys/class/power_supply/BAT1/capacity) $(date "+%a %m-%d %R")"; sleep 1; done &
#        setxkbmap -layout gb &
#        exec xfce4-power-manager &
#        exec dwm
#        ;;
#
#    xfce       )
#        exec startxfce4
#        ;;
#    *          ) exec $1;;
#
#exec startxfce4
