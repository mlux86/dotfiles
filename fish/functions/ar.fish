# Defined in - @ line 1
function ar --wraps='sudo apt-get remove' --description 'alias ar sudo apt-get remove'
  sudo apt-get remove $argv;
end
