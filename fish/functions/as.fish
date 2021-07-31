# Defined in - @ line 1
function as --wraps='apt-cache search' --description 'alias as apt-cache search'
  apt-cache search $argv;
end
