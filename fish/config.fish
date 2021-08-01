if type -q zoxide
    zoxide init fish | source
end

# general

abbr -a s sudo
abbr -a more less
abbr -a o xdg-open
abbr -a pgrep pgrep -l

# package management

abbr -a ai sudo apt-get install
abbr -a ar sudo apt-get remove --purge
abbr -a as apt-cache search
abbr -a au sudo apt-get update
abbr -a auu sudo apt-get upgrade
abbr -a auuu sudo apt-get dist-upgrade

# git

abbr -a g git
abbr -a ga git add
abbr -a gr git remove
abbr -a gc git commit
abbr -a gs git status
abbr -a gco git checkout

