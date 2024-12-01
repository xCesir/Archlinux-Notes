import in_place

find = [
    "bind = $mainMod, RETURN, exec, ~/.config/ml4w/settings/terminal.sh # Open the termina",
    "bind = $mainMod, Q, killactive # Kill active window",
    "bind = $mainMod, T, togglefloating # Toggle active windows into floating mode",
    "bind = $mainMod SHIFT, T, exec, $HYPRSCRIPTS/toggleallfloat.sh # Toggle all windows into floating mode",
    "bind = $mainMod, J, togglesplit # Toggle split",
    "bind = $mainMod SHIFT, right, resizeactive, 100 0 # Increase window width with keyboard",
    "bind = $mainMod SHIFT, left, resizeactive, -100 0 # Reduce window width with keyboard",
    "bind = $mainMod SHIFT, down, resizeactive, 0 100 # Increase window height with keyboard",
    "bind = $mainMod SHIFT, up, resizeactive, 0 -100 # Reduce window height with keyboard",
    "bind = $mainMod CTRL, RETURN, exec, pkill rofi || rofi -show drun -replace -i # Open application launcher",
    "bind = $mainMod, V, exec, $SCRIPTS/cliphist.sh # Open clipboard manager",
    "bind = $mainMod, K, swapsplit # Swapsplit",
    "bind = $mainMod, K, swapsplit # Swapsplit",
    "bind = $mainMod, K, swapsplit # Swapsplit",
    "bind = $mainMod, K, swapsplit # Swapsplit",
    "bind = $mainMod, K, swapsplit # Swapsplit",
    "bind = $mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh # Open the calculator",


]

replace = [
    "bind = $mainMod, Q, exec, ~/.config/ml4w/settings/terminal.sh # Open the terminal",
    "bind = $mainMod, C, killactive # Kill active window",
    "bind = $mainMod, G, togglefloating # Toggle active windows into floating mode",
    "bind = $mainMod SHIFT, G, exec, $HYPRSCRIPTS/toggleallfloat.sh # Toggle all windows into floating mode",
    "bind = $mainMod, O, togglesplit # Toggle split",
    "bind = $mainMod ALT, right, resizeactive, 100 0 # Increase window width with keyboard",
    "bind = $mainMod ALT, left, resizeactive, -100 0 # Reduce window width with keyboard",
    "bind = $mainMod ALT, down, resizeactive, 0 100 # Increase window height with keyboard",
    "bind = $mainMod ALT, up, resizeactive, 0 -100 # Reduce window height with keyboard",
    "bind = $mainMod, R, exec, pkill rofi || rofi -show drun -replace -i # Open application launcher",
    "bind = $mainMod, V, exec, copyq show # Open clipboard manager",
    "bind = $mainMod, K, swapsplit # Swapsplit\nbind = $mainMod SHIFT, right, movewindow, r\n",
    "bind = $mainMod, K, swapsplit # Swapsplit\nbind = $mainMod SHIFT, left, movewindow, l",
    "bind = $mainMod, K, swapsplit # Swapsplit\nbind = $mainMod SHIFT, down, movewindow, d",
    "bind = $mainMod, K, swapsplit # Swapsplit\nbind = $mainMod SHIFT, up, movewindow, u",
    "bind = $mainMod, K, swapsplit # Swapsplit\n# Move Window with mainMod + shift +arrow",
    "bind = $mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh # Open the calculator\nbind = $mainMod, M, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle # Toggle microphone",
]

for i in range(len(find)):
    with in_place.InPlace('./.config/hypr/conf/keybindings/default') as file:
        for line in file:
            line = line.replace(find[i], replace[i])
            file.write(line)
        file.close()