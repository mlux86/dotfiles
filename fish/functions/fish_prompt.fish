function fish_prompt
    set -l last_status $status

    # User@hostname in green
    set_color green
    echo -n "$USER@"(hostname -s)
    set_color normal
    echo -n " "

    # Current directory in blue
    set_color blue
    echo -n (prompt_pwd)
    set_color normal

    # Git branch if in a git repo
    if set -l branch (git branch --show-current 2>/dev/null)
        echo -n " ("
        set_color yellow
        echo -n $branch
        set_color normal
        echo -n ")"
    end

    # Prompt symbol (red if last command failed)
    if test $last_status -ne 0
        set_color red
    end
    echo -n " > "
    set_color normal
end
