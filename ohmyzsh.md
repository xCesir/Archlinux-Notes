# oh-my-zsh
```
sudo pacman -S zsh zsh-doc
```

## Manual (recommended)
### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
nano ~/.zshrc
```
In `~/.zshrc` `zsh-autosuggestions` bei `plugins` einfügen bei:

```
plugins=(#other_plugins zsh-autosuggestions)
```

### [zsh-completions](https://github.com/zsh-users/zsh-completions)
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
nano ~/.zshrc
```
nach `source $ZSH/oh-my-zsh.sh` suche und in der Zeile davor einfügen:

```
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```

Falls es nicht funktiniert ist ein Issue im Git verlinkt

### [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
``` 
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
nano ~/.zshrc
```
In `~/.zshrc` `zsh-history-substring-search` bei `plugins` einfügen bei:
```
plugins=( [plugins...] zsh-history-substring-search)
```
```
exec zsh
```
### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
### [powerlevel10k - theme](https://github.com/romkatv/powerlevel10k)
```
cd ~/.oh-my-zsh/custom/themes/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
echo "source ${(q-)PWD}/powerlevel10k/powerlevel10k.zsh-theme" >> ${ZDOTDIR:-$HOME}/.zshrc
exit
```
```
sudo pacman -S nerd-fonts adobe-source-code-pro-fonts ttf-font-awesome powerline-fonts ttf-meslo-nerd 
```
#### [Recommended Font](https://github.com/romkatv/powerlevel10k/blob/master/font.md)
```
yay -S ttf-meslo-nerd-font-powerlevel10k 
```
```
MesloLGS NF Regular
```

### Update (all)
```
pushd ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
git pull
popd
pushd ~/.oh-my-zsh/custom/plugins/zsh-completions/
git pull
popd
pushd ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/
git pull
popd
pushd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
git pull
popd
pushd ~/.oh-my-zsh/custom/themes/powerlevel10k/
git pull
popd
omz update
exec zsh
```

## Arch
### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
```
sudo pacman -S zsh-autosuggestions
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

### [zsh-completions](https://github.com/zsh-users/zsh-completions)
```
sudo pacman -S zsh-completions
```
nach `source $ZSH/oh-my-zsh.sh` suche und in die Zeile *davor* einfügen:
```
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```
Falls es nicht funktiniert ist einb Issue im Git verlinkt

### [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
``` 
sudo pacman -S zsh-history-substring-search
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
sudo pacman -S zsh-syntax-highlighting
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```

### [powerlevel10k - theme](https://github.com/romkatv/powerlevel10k)
```
cd ~/.oh-my-zsh/custom/themes/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
echo "source ${(q-)PWD}/powerlevel10k/powerlevel10k.zsh-theme" >> ${ZDOTDIR:-$HOME}/.zshrc
exit
```

### Update
```
alias pacupdate="
pushd ~/.oh-my-zsh/custom/themes/powerlevel10k
git pull
popd
omz update
sudo pacman -Syu
"

```

## fastfetch
Put at the beginning of `~/.zshrc`:
```
sleep 0.1
fastfetch --logo arch2
```
