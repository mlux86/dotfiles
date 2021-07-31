# Defined in - @ line 1
function pgrep --wraps='pgrep -l' --description 'alias pgrep pgrep -l'
 command pgrep -l $argv;
end
