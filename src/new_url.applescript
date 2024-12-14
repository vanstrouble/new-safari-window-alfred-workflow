on run argv
    set theURL to item 1 of argv
    if theURL does not start with "http://" and theURL does not start with "https://" then
        set theURL to "http://" & theURL
    end if
    tell application "Safari"
        make new document with properties {URL:theURL}
        activate
    end tell
end run
