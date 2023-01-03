# tmux TERM handling

if test -n "$TMUX"
    set -x TERM xterm-256color
end

if test -n "$ALACRITTY_WINDOW_ID"
    and test -z "$TMUX"
    exec tmux new -A -s myterm
end

set -gx EDITOR vim

# disable fish greeting

set fish_greeting

# configure hydro

set hydro_symbol_prompt (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯'
set hydro_color_pwd blue
set hydro_color_git cyan

# zoxide

if type -q zoxide
    zoxide init fish | source
end

# general

abbr -a l ls -la
abbr -a s sudo
abbr -a o xdg-open
abbr -a more less
abbr -a pgrep pgrep -l
abbr -a fuck pkill -KILL
abbr -a v vim
abbr -a jn jupyter notebook

# productivity

abbr -a t subl ~/notes/todo.md

# dev

abbr -a lg lazygit
abbr -a nr npm run
abbr -a dc docker-compose
abbr -a kc kubectl
abbr -a tf terraform

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

abbr -a S sudo pacman -S
abbr -a Ss pacman -Ss
abbr -a Syu sudo pacman -Syu
abbr -a Qs sudo pacman -Qs
abbr -a Rsn sudo pacman -Rsn

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

