# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias vim='nvim'
alias vi='nvim'
alias ls='ls --color=always'
alias la='ls --almost-all'
alias ff='firefox'

source ~/.shell_prompt.sh
