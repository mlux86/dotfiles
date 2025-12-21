#!/usr/bin/fish

# Check if an argument was provided (up, down, or mute)
set ACTION $argv[1]

switch $ACTION
    case up
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    case down
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    case mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
end

# Fetch current state after the change
set VOLUME (pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n 1)
set MUTE (pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# Determine Icon and Notification Text
if test "$MUTE" = "yes"
    set ICON "audio-volume-muted"
    set TEXT "Muted"
    set VALUE 0
else
    set TEXT "Volume: $VOLUME%"
    set VALUE $VOLUME
    # Change icon based on volume level
    if test $VOLUME -lt 30
        set ICON "audio-volume-low"
    else if test $VOLUME -lt 70
        set ICON "audio-volume-medium"
    else
        set ICON "audio-volume-high"
    end
end

# Send the notification to Mako
notify-send -a "System" \
    -r 9993 \
    -t 1000 \
    -h string:x-canonical-private-synchronous:volume \
    -h int:value:"$VALUE" \
    -i "$ICON" \
    "$TEXT"

