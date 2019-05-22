# start i3
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x i3 || exec startx
fi

export EDITOR="vim"
export TERMINAL="xfce4-terminal"
