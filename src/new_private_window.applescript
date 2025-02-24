on run argv
    set userLang to do shell script "defaults read -g AppleLocale | cut -d '_' -f 1"

    if userLang is equal to "es" then
        set newPrivateWindow to "Nueva ventana privada"
        set fileMenu to "Archivo"
    else
        set newPrivateWindow to "New Private Window"
        set fileMenu to "File"
    end if

    set safariRunning to false
    tell application "System Events"
        set safariRunning to (exists process "Safari")
    end tell

    if not safariRunning then
        tell application "Safari" to activate
        delay 1

        tell application "System Events"
            tell process "Safari"
                try
                    set frontmost to true
                    click button 1 of window 1
                end try
            end tell
        end tell

        delay 0.5
    end if

    tell application "System Events"
        tell process "Safari"
            click menu item newPrivateWindow of menu fileMenu of menu bar 1
        end tell
    end tell

    tell application "Safari" to activate

    if (count of argv) > 0 then
        set theURL to item 1 of argv
        if theURL does not start with "http://" and theURL does not start with "https://" then
            set theURL to "http://" & theURL
        end if
        tell application "Safari"
            set URL of front document to theURL
        end tell
    end if
end run
