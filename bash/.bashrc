#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias shutdown='shutdown -h now'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'

bind 'set completion-ignore-case on' # ignore case on Tab complition

export PS1='\[\e]0;\w\a\]\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]\n\$ '
