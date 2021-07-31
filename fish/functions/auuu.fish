# Defined in - @ line 1
function auuu --wraps='sudo apt-get dist-upgrade' --description 'alias auuu sudo apt-get dist-upgrade'
  sudo apt-get dist-upgrade $argv;
end
