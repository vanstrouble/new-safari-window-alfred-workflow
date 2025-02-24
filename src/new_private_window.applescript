on run argv
    -- Get the system language
    set userLang to do shell script "defaults read -g AppleLocale | cut -d '_' -f 1"

    -- Define variables for the menu item names
    if userLang is equal to "es" then
        set newPrivateWindow to "Nueva ventana privada"
        set fileMenu to "Archivo"
    else
        set newPrivateWindow to "New Private Window"
        set fileMenu to "File"
    end if

    -- Execute the script with the appropriate menu item names
    tell application "System Events" to
        click menu item newPrivateWindow of
            menu fileMenu of menu bar 1 of
            application process "Safari"
    tell application "Safari" to activate

    -- Check if a URL is provided as an argument
    if (count of argv) > 0 then
        set theURL to item 1 of argv
        if theURL does not start with "http://" and theURL does not start with "https://" then
            set theURL to "http://" & theURL
        end if
        -- Open the specified URL in the new private window
        tell application "Safari"
            set URL of front document to theURL
        end tell
    end if
end run
