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
tell application "System Events" to ¬
    click menu item newPrivateWindow of ¬
        menu fileMenu of menu bar 1 of ¬
        application process "Safari"
tell application "Safari" to activate
