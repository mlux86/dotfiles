function hidrive -a user action dir opts
    if set -q $user
        echo "User not set!"
        return
    end

    if set -q $action
        echo "Action not set!"
        return
    end

    if set -q $dir
        echo "Target directory not set!"
        return
    end

    if not test -d $dir
        echo "Target directory does not exist!"
        return
    end


    switch $action
        case push
            rsync $opts -rltDve ssh $dir rsync.hidrive.strato.com:/users/$user/
        case pull
            rsync $opts -rltDve ssh rsync.hidrive.strato.com:/users/$user/ $dir
        case '*'
            echo Unsupported action: $action
    end
end


