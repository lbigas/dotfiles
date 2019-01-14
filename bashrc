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
PS1='[\u@\h \W]\$ '

# enter a directory without needing to write cd
shopt -s autocd

alias shutdown='shutdown -h now'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'

alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."

alias v=vim
alias sv="sudo -E vim"
alias r=ranger

alias starwars="telnet towel.blinkenlights.nl"

alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

export PATH=$PATH:$HOME/.bin

bind 'set completion-ignore-case on' # ignore case on Tab complition


#RCol='\033[0m'
#Gre='\033[32m';
#Red='\033[31m';
#Blu='\033[34m';
#Yel='\033[33m';
#PS1="${RCol}┌─[\`if [ \$? = 0 ]; then echo "${Gre}"; else echo "${Red}"; fi\`\t\[${Rcol}\] \[${Blu}\]\h\[${RCol}\] \[${Yel}\]\w\[${RCol}\]]\n└─╼ "

export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '
