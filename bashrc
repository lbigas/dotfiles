# _               _              
#| |__   __ _ ___| |__  _ __ ___ 
#| '_ \ / _` / __| '_ \| '__/ __|
#| |_) | (_| \__ \ | | | | | (__ 
#|_.__/ \__,_|___/_| |_|_|  \___|

#
# ~/.bashrc
#

# enter a directory without needing to write cd
shopt -s autocd

bind 'set completion-ignore-case on' # ignore case on Tab complition

alias ..="cd .."
alias 2..="cd ../.."
alias 3..="cd ../../.."
alias 4..="cd ../../../.."

alias v=nvim
alias sv="sudo -E nvim"
alias r=ranger

alias ls='ls -hN --color=auto'
alias la="ls -a"
alias ll="ls -
RCol='\033[0m';
Gre='\033[32m';
Red='\033[31m';
Blu='\033[34m';
Yel='\033[33m';
Cyan='\033[0;36m';

smiley()
{
  if [ "$?" == "0" ]; then
    echo -e '\e[0;32m:) '
  else
    echo -e '\e[0;31m:( '
  fi
}

# PS1="${RCol}┌─["'`smiley`'"\[${Cyan}\]\h@\u\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ "
PS1="${RCol}┌─[\[${Cyan}\]\h@\u\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ "

#PS1='[\u@\h \W]\$ '
#PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '
