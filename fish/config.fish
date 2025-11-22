# tmux TERM handling

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

abbr -a s sudo
abbr -a o open
abbr -a more less
abbr -a pgrep pgrep -l
abbr -a fuck pkill -KILL
abbr -a v nvim
abbr -a jn jupyter notebook

# dev

abbr -a lg lazygit
abbr -a ld lazydocker
abbr -a nr npm run
abbr -a dc docker-compose
abbr -a kc kubectl
abbr -a tf terraform

# package management

abbr -a ai sudo apt install
abbr -a ar sudo apt remove --purge
abbr -a as apt search
abbr -a au sudo apt update
abbr -a auu sudo apt upgrade
abbr -a auuu sudo apt dist-upgrade

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

