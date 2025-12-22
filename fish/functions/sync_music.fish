function sync_music
    set -l remote_src "mlux@box:music/"
    set -l local_dest "$HOME/music/"

    echo "--- Checking connection to box ---"
    if ping -c 1 -W 2 box >/dev/null
        echo "Connection established. Starting music sync..."
        
        # Run rsync with your preferred flags
        if rsync -havzP --stats --delete $remote_src $local_dest
            set_color green
            echo "Successfully synced music from box."
            set_color normal
        else
            set_color red
            echo "Error: rsync encountered a problem during transfer."
            set_color normal
            return 1
        end
    else
        set_color red
        echo "Error: Cannot reach 'box'. Are you on the right network?"
        set_color normal
        return 1
    end
end

