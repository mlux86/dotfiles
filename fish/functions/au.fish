# Defined in - @ line 1
function au --wraps='sudo apt-get update' --description 'alias au sudo apt-get update'
  sudo apt-get update $argv;
end
