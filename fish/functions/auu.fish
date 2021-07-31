# Defined in - @ line 1
function auu --wraps='sudo apt-get upgrade' --description 'alias auu sudo apt-get upgrade'
  sudo apt-get upgrade $argv;
end
