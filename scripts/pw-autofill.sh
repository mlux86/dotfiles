#!/usr/bin/env fish

# Ensure the vault is unlocked
rbw unlock

# 1. Define our special commands
set actions "MODE: Password Only" "MODE: 2FA Only" "MODE: Username Only"

# 2. Get the vault list and prepend the actions
set selection (printf "%s\n" $actions (rbw list) | rofi -dmenu -i -p "Vaultwarden")

if test -z "$selection"
    exit 0
end

# 3. Determine if the user chose a special mode or just an account
set final_item "$selection"
set mode "Auto-Login" # Default

for action in $actions
    if test "$selection" = "$action"
        # If a mode was picked, we need a second menu to pick WHICH account
        set mode (string replace "MODE: " "" "$selection")
        set final_item (rbw list | rofi -dmenu -i -p "Select Account for $mode")
        break
    end
end

# Exit if no account was selected in the second step
if test -z "$final_item"
    exit 0
end

# 4. Fetch credentials
set username (rbw get "$final_item" --field username)
set password (rbw get "$final_item" --field password)
set totp_code (rbw code "$final_item" 2>/dev/null)

# --- Automation Logic ---

switch "$mode"
    case "Auto-Login"
        if test -n "$username"
            ydotool type --key-delay=5 "$username"
            ydotool key 15:1 15:0 # Tab
            sleep 0.2
        end
        ydotool type --key-delay=5 "$password"

    case "Password Only"
        ydotool type --key-delay=5 "$password"

    case "2FA Only"
        if test -n "$totp_code"
            ydotool type --key-delay=5 "$totp_code"
        end

    case "Username Only"
        ydotool type --key-delay=5 "$username"
end
