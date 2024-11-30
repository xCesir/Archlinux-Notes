# create Backup folder structure
mkdir -p ~/Documents/ml4w-backup/.config/
mkdir ~/Documents/ml4w-backup/.config/nvim/
mkdir ~/Documents/ml4w-backup/.config/kitty/
mkdir ~/Documents/ml4w-backup/.config/alacritty/

# copy backup files
cp ~/.zshrc ~/Documents/ml4w-backup/.zshrc
cp ~/Documents/ml4w-backup/.config/nvim/init.lua
cp ~/Documents/ml4w-backup/.config/kitty/kitty.conf
cp ~/Documents/ml4w-backup/.config/alacritty/alacritty.toml

# remove unwanted configs
rm ~/.config/fastfetch/config.jsonc

IS="$(diff ~/.config/hypr/conf/keybindings/fr.conf ./conf/keybindings/default.conf)"
EXPECTED=$(<./keybind.diff)
DIFF="$(diff <(echo "$IS") <(echo "$EXPECTED"))"
echo "$DIFF"
if [ "$DIFF" == "" ]; then
	echo "Y"
else
	echo "N"
fi
