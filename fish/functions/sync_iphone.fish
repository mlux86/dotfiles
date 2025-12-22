function sync_iphone
    set -l mount_point "/mnt/iphone"
    set -l music_src "/home/mlux/music/Albums/"
    set -l podcast_src "/home/mlux/music/byte.fm/"

    # Pre-flight check
    if not idevice_id -l >/dev/null
        set_color red
        echo "No iPhone detected via USB."
        set_color normal
        return 1
    end

    # Ensure mount point is clean
    if mountpoint -q $mount_point
        fusermount -u $mount_point
    end

    # Helper function using $argv
    function _sync_app
        set -l app_id $argv[1]
        set -l src_dir $argv[2]
        set -l dest_subdir $argv[3]
        set -l mnt $argv[4]

        echo "--- Mounting $app_id ---"
        if ifuse $mnt --documents $app_id
            echo "Syncing $src_dir to $mnt/$dest_subdir/..."
            
            # Ensure the destination subdirectory exists inside the app container
            mkdir -p "$mnt/$dest_subdir"
            
            rsync -havzP --delete $src_dir "$mnt/$dest_subdir/"
            
            echo "Unmounting $app_id..."
            fusermount -u $mnt
        else
            set_color red
            echo "Error: Failed to mount $app_id."
            set_color normal
            return 1
        end
    end

    # Sync Doppler
    _sync_app "co.brushedtype.doppler-ios" $music_src "Albums" $mount_point

    # Sync Foobar
    _sync_app "com.foobar2000.mobile" $podcast_src "byte.fm" $mount_point

    echo "Finished sync process."
end
