# oh-my-zsh
```
sudo pacman -S zsh zsh-doc
```
## [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
nano ~/.zshrc
```
add
plugins=( 
    # other plugins...
    zsh-autosuggestions
)

## [zsh-completions](https://github.com/zsh-users/zsh-completions)
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
nano ~/.zshrc
```
nach `source "$ZSH/oh-my-zsh.sh"` suche und davor einfügen:
```
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
```
Falls es nicht funktiniert ist einb Issue im Git verlinkt

## [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
``` 
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
nano ~/.zshrc
```
add
plugins=( [plugins...] zsh-history-substring-search)
```
exec zsh
```
## [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
```
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
## [powerlevel10k - theme](https://github.com/romkatv/powerlevel10k)
```
cd ~/.oh-my-zsh/custom/themes/
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
echo "source ${(q-)PWD}/powerlevel10k/powerlevel10k.zsh-theme" >> ${ZDOTDIR:-$HOME}/.zshrc
exit
```
```
sudo pacman -S nerd-fonts adobe-source-code-pro-fonts ttf-font-awesome powerline-fonts ttf-meslo-nerd 
```
