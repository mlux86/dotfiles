function hidrive -a user action remote_dir local_dir opts
    if set -q $user
        echo "User not set!"
        return
    end

    if set -q $action
        echo "Action not set!"
        return
    end

    if set -q $remote_dir
        echo "Remote directory not set!"
        return
    end

    if not string match -qr '^/.*' $remote_dir
        echo "Remote directory must start with a slash!"
        return
    end

    if set -q $local_dir
        echo "Local directory not set!"
        return
    end

    if not test -d $local_dir
        echo "Local directory does not exist!"
        return
    end


    switch $action
        case push
            rsync --delete $opts -rltDvze ssh $local_dir $user@rsync.hidrive.strato.com:/users/$user$remote_dir
        case pull
            rsync --delete $opts -rltDvze ssh $user@rsync.hidrive.strato.com:/users/$user$remote_dir $local_dir
        case '*'
            echo Unsupported action: $action
    end
end


