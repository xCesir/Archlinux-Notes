import in_place

find_in_keybinds = [
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
    "bind = $mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh # Open the calculator",
]

replace_in_keybinds = [
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
    "bind = $mainMod, K, swapsplit # Swapsplit\n\n# Move Window with mainMod + shift +arrow\nbind = $mainMod SHIFT, up, movewindow, u\nbind = $mainMod SHIFT, down, movewindow, d\nbind = $mainMod SHIFT, left, movewindow, l\nbind = $mainMod SHIFT, right, movewindow, r\n",
    'bind = $mainMod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh # Open the calculator\nbind = $mainMod, M, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle # Toggle microphone,\nbind = $mainMod, M, exec, dunstify "$(if [ "$(pactl get-source-mute @DEFAULT_SOURCE@)" = "Mute: no" ]; then echo Microphone muted; else echo Microphone unmuted; fi)"'

]

for i in range(len(find_in_keybinds)):
    with in_place.InPlace('./.config/hypr/conf/keybindings/default') as file:
        for line in file:
            line = line.replace(find_in_keybinds[i], replace_in_keybinds[i])
            file.write(line)
        file.close()

find_in_monitors = [
    "monitor=,preferred,auto,1"
]

replace_in_monitors = [
    "monitor=DP-3, 1920x1080@75, 0x0, auto\nmonitor=DP-1, 3440x1440@120, 1920x0, auto\nmonitor=HDMI-A-1, 1920x1080@75, 5360x0, auto"
]

for i in range(len(find_in_monitors)):
    with in_place.InPlace('./.config/hypr/conf/monitors/default') as file:
        for line in file:
            line = line.replace(find_in_monitors[i], replace_in_monitors[i])
            file.write(line)
        file.close()

find_in_autostart = [
    "# Load cliphist history"
    "exec-once = wl-paste --watch cliphist store"
]

replace_in_autostart = [
    "# Load copyq server"
    "exec-once = copyq --start-server\n\n# Autostart CoreCtrl\nexec-once = corectrl &\n\n# Autostart Nextcloud\nexec-once = nextcloud &\n\n# Autostart coolercontrol\nexec-once = coolercontrol &"
]

for i in range(len(find_in_autostart)):
    with in_place.InPlace('./.config/hypr/conf/autostart.conf') as file:
        for line in file:
            line = line.replace(find_in_autostart[i], replace_in_autostart[i])
            file.write(line)
        file.close()

find_in_system_monitor = [
    "$(cat ~/.config/ml4w/settings/terminal.sh) --class dotfiles-floating -e htop",
]

replace_in_system_monitor = [
    "$(cat ~/.config/ml4w/settings/terminal.sh) --class dotfiles-floating -e btop",
]

for i in range(len(find_in_system_monitor)):
    with in_place.InPlace('./.config/ml4w/settings/system-monitor') as file:
        for line in file:
            line = line.replace(find_in_system_monitor[i], replace_in_system_monitor[i])
            file.write(line)
        file.close()

find_in_config = [
    '"spacing": 0',
    '"custom/updates",',
    '"pulseaudio",',
]

replace_in_config = [
        '"spacing": 0,\n"output": "DP-1",',
        '"privacy",\n"custom/updates",',
        '"group/audio",',
]

for i in range(len(find_in_config)):
    with in_place.InPlace('./.config/waybar/themes/ml4w/configtest') as file:
        for line in file:
            line = line.replace(find_in_config[i], replace_in_config[i])
            file.write(line)
        file.close()

find_in_style = [
    "#custom-updates",
]

replace_in_style = [
    "#privacy,\n#custom-updates",
]

for i in range(len(find_in_style)):
    with in_place.InPlace('./.config/waybar/themes/ml4w/style') as file:
        for line in file:
            line = line.replace(find_in_style[i], replace_in_style[i])
            file.write(line)
        file.close()

find_in_module = [
    "// Pulseaudio",  
    '"format-muted": " {format_source}",',
    '"format-source": "{volume}% ",',
    '"format-source-muted": "",',
    '"on-click": "pavucontrol"',
    '"tooltip-format": "{icon} {desc} | {volume}%",',

]

replace_in_module = [
    '// Group Links\n"group/audio": {\n"orientation": "horizontal",\n"modules": [\n"pulseaudio",\n"pulseaudio#microphone",\n]\n},\n\n// Pulseaudio',
    "",
    "",
    '"format-muted": "  {volume}%",',
    '"on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",\n"on-click-right": "/usr/bin/pavucontrol -t 3",\n"on-scroll-down": "pactl set-sink-volume @DEFAULT_SINK@ -1%",\n"on-scroll-up": "pactl set-sink-volume @DEFAULT_SINK@ +1%",\n"tooltip-format": "{icon} {desc} | {volume}%",',
    '"tooltip-format": "{icon} {desc} | {volume}%",},\n"pulseaudio#microphone": {\n"format": "{format_source}",\n"format-source": " {volume}%",\n"format-source-muted": "",\n"on-click": "pavucontrol -t 4",\n"on-click": "pactl set-source-mute @DEFAULT_SOURCE@ toggle",\n"on-click-right": "/usr/bin/pavucontrol -t 4",\n"on-scroll-down": "pactl set-source-volume @DEFAULT_SOURCE@ -1%",\n"on-scroll-up": "pactl set-source-volume @DEFAULT_SOURCE@ +1%",\n"scroll-step": 5,\n\n',

]

for i in range(len(find_in_module)):
    with in_place.InPlace('./.config/waybar/modules') as file:
        for line in file:
            line = line.replace(find_in_module[i], replace_in_module[i])
            file.write(line)
        file.close()
