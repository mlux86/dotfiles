# Defined in - @ line 1
function ai --wraps='sudo apt-get install' --description 'alias ai sudo apt-get install'
  sudo apt-get install $argv;
end
