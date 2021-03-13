export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mlux/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"

plugins=(debian git docker taskwarrior spring tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR=vim
export LANG=en_US.UTF-8

# General aliases
alias s='sudo'
alias more='less'
alias pgrep='pgrep -l'
alias e='$EDITOR'
alias o='xdg-open'

# git aliases
alias g='git'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gr='git remove'
alias gco='git checkout'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gdiff='git difftool -y -t meld'

