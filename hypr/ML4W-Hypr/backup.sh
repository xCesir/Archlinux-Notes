# create Backup folder structure
mkdir -p ~/Documents/ml4w-backup/.config/
mkdir ~/Documents/ml4w-backup/.config/nvim/
mkdir ~/Documents/ml4w-backup/.config/kitty/
mkdir ~/Documents/ml4w-backup/.config/alacritty/

# copy backup files
cp ~/.zshrc ~/Documents/ml4w-backup/.zshrc
cp ~/.config/nvim/init.lua ~/Documents/ml4w-backup/.config/nvim/init.lua
cp ~/.config/kitty/kitty.conf ~/Documents/ml4w-backup/.config/kitty/kitty.conf
cp ~/.config/alacritty/alacritty.toml ~/Documents/ml4w-backup/.config/alacritty/alacritty.toml
