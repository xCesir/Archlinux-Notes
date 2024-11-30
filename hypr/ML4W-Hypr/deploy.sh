# remove unwanted configs
rm ~/.config/fastfetch/config.jsonc
rm ~/.config/nvim/init.vim

# deploy backup configs
cp ~/Documents/ml4w-backup/.zshrc ~/.zshrc 
cp ~/Documents/ml4w-backup/.config/nvim/init.lua ~/.config/nvim/init.lua 
cp ~/Documents/ml4w-backup/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf 
cp ~/Documents/ml4w-backup/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml 

# replace ml4w config with our adpated configs
IS="$(diff ~/.config/hypr/conf/keybindings/default.conf ./.config/hypr/conf/keybindings/default.conf)"
EXPECTED=$(<./.config/hypr/conf/keybindings/default.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
    cp -v ./.config/hypr/conf/keybindings/default.conf ~/.config/hypr/conf/keybindings/default.conf 
else
	echo "N"
fi

IS="$(diff ~/.config/hypr/conf/monitors/default.conf ./.config/hypr/conf/monitors/default.conf)"
EXPECTED=$(<./.config/hypr/conf/monitors/default.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
    cp -v ./.config/hypr/conf/monitors/default.conf ~/.config/hypr/conf/monitors/default.conf 
else
	echo "N"
fi

IS="$(diff ~/.config/hypr/conf/autostart.conf ./.config/hypr/conf/autostart.conf)"
EXPECTED=$(<./.config/hypr/conf/autostart.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
    cp -v ./.config/hypr/conf/autostart.conf ~/.config/hypr/conf/autostart.conf 
else
	echo "N"
fi

IS="$(diff ~/.config/ml4w/settings/system-monitor.sh ./.config/ml4w/settings/system-monitor.sh)"
EXPECTED=$(<./.config/ml4w/settings/system-monitor.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
    cp -v ./.config/ml4w/settings/system-monitor.sh ~/.config/ml4w/settings/system-monitor.sh 
else
	echo "N"
fi

IS="$(diff ~/.config/waybar/themes/ml4w/config ./.config/waybar/themes/ml4w/config)"
EXPECTED=$(<./.config/waybar/themes/ml4w/config.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
	cp -v ./.config/waybar/themes/ml4w/config ~/.config/waybar/themes/ml4w/config 
else
	echo "N"
fi

IS="$(diff ~/.config/waybar/modules.json ./.config/waybar/modules.json)"
EXPECTED=$(<./.config/waybar/modules.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
	cp -v ./.config/waybar/modules.json ~/.config/waybar/modules.json 
else
	echo "N"
fi
