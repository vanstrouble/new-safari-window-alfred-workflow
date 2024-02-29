on alfred_script(q)
    tell application "System Events" to ¬
        click menu item "Nueva ventana privada" of ¬
            menu "Archivo" of menu bar 1 of ¬
            application process "Safari"
    tell application "Safari" to activate
end alfred_script