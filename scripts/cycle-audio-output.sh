#!/usr/bin/env fish

# Get list of sink names
set sinks (pactl list short sinks | awk '{print $2}')

# Get current default sink
set current (pactl get-default-sink)

# Find index of current sink in list
set index -1
for i in (seq (count $sinks))
    if test $sinks[$i] = "$current"
        set index $i
        break
    end
end

# If current sink not found, default to first
if test $index -eq -1
    pactl set-default-sink $sinks[1]
    notify-send -i audio-card -t 1000 "Audio Output Changed" "Now using sink: $sinks[1]"
    exit 0
end

# Compute next index (proper fish math)
set sink_count (count $sinks)
set next_index (math "($index % $sink_count) + 1")

# Switch to next sink
set new_sink $sinks[$next_index]
pactl set-default-sink $new_sink

# Move all streams
for input in (pactl list short sink-inputs | awk '{print $1}')
    pactl move-sink-input $input $new_sink
end

# Notification (KDE Plasma compatible)
notify-send -i audio-card -t 1000 "Audio Output Changed" "Now using sink: $new_sink"

exit 0
