on run argv
    set safariRunning to false
    tell application "System Events"
        set safariRunning to (exists process "Safari")
    end tell

    if not safariRunning then
        tell application "Safari" to activate
        return
    end if

    if (count of argv) > 0 then
        set theURL to item 1 of argv
        if theURL does not start with "http://" and theURL does not start with "https://" then
            set theURL to "http://" & theURL
        end if
        tell application "Safari"
            make new document with properties {URL:theURL}
            activate
        end tell
    else
        tell application "Safari"
            make new document
            activate
        end tell
    end if
end run
