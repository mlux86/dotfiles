set fish_greeting

if type -q zoxide
    zoxide init fish | source
end

# general

abbr -a s sudo
abbr -a more less
abbr -a o xdg-open
abbr -a pgrep pgrep -l
abbr -a fuck pkill -KILL

# dev

abbr -a lg lazygit
abbr -a nr npm run

# package management

abbr -a ai sudo apt-get install
abbr -a ar sudo apt-get remove --purge
abbr -a as apt-cache search
abbr -a au sudo apt-get update
abbr -a auu sudo apt-get upgrade
abbr -a auuu sudo apt-get dist-upgrade

abbr -a xi sudo xbps-install
abbr -a xr sudo xbps-remove -R
abbr -a xu sudo xbps-install -Su
abbr -a xs xbps-query -Rs
abbr -a xl xbps-query -l

# git

abbr -a g git
abbr -a gf git fetch
abbr -a ga git add
abbr -a gr git remove
abbr -a gc git commit
abbr -a gca git commit --amend
abbr -a gs git status
abbr -a gd git diff
abbr -a gco git checkout
abbr -a gu git restore --staged

test (uname) != "Darwin" && test -z $DISPLAY && test (fgconsole) -eq 1 && exec startx

