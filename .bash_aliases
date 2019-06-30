# vars
export EDITOR=vim
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000

# general aliases
alias sl='ls -h'
alias ls='ls -h'
alias ll='ls -lah --color'
alias mkdir='mkdir -p -v'
alias s='sudo'
alias more='less'
alias pgrep='pgrep -l'
alias e='$EDITOR'

# security aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# pkg management aliases (arch linux)
alias ai='sudo apt-get install'
alias au='sudo apt-get update'
alias auu='sudo apt-get upgrade'
alias ar='sudo apt-get autoremove'
alias as='apt-cache search'

# pkg management aliases (arch linux)
alias S='sudo pacman -S'
alias Syu='sudo pacman -Syu'
alias Syyu='sudo pacman -Syyu'
alias Ss='pacman -Ss'
alias Qs='pacman -Qs'
alias Rsn='sudo pacman -Rsn'
alias p='yaourt'

# git aliases
alias g='git'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gr='git remove'
alias gco='git checkout'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gdiff='git difftool -y -t meld'

# misc aliases
alias fuck='pkill -fi'
alias bye='systemctl poweroff'
alias reboot='systemctl reboot'

