
# remove unwanted configs
rm ~/.config/fastfetch/config.jsonc
rm ~/.config/nvim/init.vim

# deploy backup configs
cp ~/Documents/ml4w-backup/.zshrc ~/.zshrc 
cp ~/Documents/ml4w-backup/.config/nvim/init.lua ~/.config/nvim/init.lua 
cp ~/Documents/ml4w-backup/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf 
cp ~/Documents/ml4w-backup/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml 

# remove Backup-folder
rm -r ~/Documents/ml4w-backup/