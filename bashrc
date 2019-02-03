# _               _              
#| |__   __ _ ___| |__  _ __ ___ 
#| '_ \ / _` / __| '_ \| '__/ __|
#| |_) | (_| \__ \ | | | | | (__ 
#|_.__/ \__,_|___/_| |_|_|  \___|

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# enter a directory without needing to write cd
shopt -s autocd

alias shutdown='shutdown -h now'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'

alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."

#alias v=vim
#alias sv="sudo -E vim"
alias v=nvim
alias sv="sudo -E nvim"
alias r=ranger

alias ls='ls -hN --color=auto'
alias la="ls -a"
alias ll="ls -l"
#alias grep="grep --color=auto"
#alias diff="diff --color=auto"

alias starwars="telnet towel.blinkenlights.nl"

alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

export PATH=$PATH:$HOME/.bin

bind 'set completion-ignore-case on' # ignore case on Tab complition


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

PS1="${RCol}┌─["'`smiley`'"\[${Cyan}\]\h@\u\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ "

#PS1='[\u@\h \W]\$ '
#PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
