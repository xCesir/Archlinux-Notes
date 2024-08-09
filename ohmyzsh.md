# oh-my-zsh
```
sudo pacman -S zsh zsh-doc zsh-completions git
```

## Manual (recommended)
### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/wiki)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
In `~/.zshrc` `zsh-autosuggestions` bei `plugins` einfügen bei:

```
sed -i 's/plugins=(git/plugins=(git\ zsh-autosuggestions/g' ~/.zshrc
```

### [zsh-completions](https://github.com/zsh-users/zsh-completions)
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```
nach `source $ZSH/oh-my-zsh.sh` suchen und in der Zeile davor `fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src` einfügen:

```
sed -i 's/sourc\e \$ZSH\/oh-my-zsh.sh/fpath\+\=\$\{ZSH\_CUSTOM\:\-\$\{ZSH\:\-\~\/.oh\-my\-zsh\}\/custom\}\/plugins\/zsh-completions\/src\nsourc\e \$ZSH\/oh-my-zsh.sh/g' ~/.zshrc
```

Falls es nicht funktiniert ist ein Issue im Git verlinkt

### [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
``` 
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```
In `~/.zshrc` `zsh-history-substring-search` bei `plugins` einfügen bei:
```
sed -i 's/plugins=(git/plugins=(git\ zsh-history-substring-search/g' ~/.zshrc
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
sudo pacman -S ttf-meslo-nerd
```

### andere gute fonts
```
sudo pacman -S nerd-fonts adobe-source-code-pro-fonts ttf-font-awesome powerline-fonts 
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
```
sed -i 's/\#\ alias\ ohmyzsh\=\"mate\ \~\/.oh-my-zsh\"/\#\ alias\ ohmyzsh\=\"mate\ \~\/.oh-my-zsh\"\nalias\ fullomzupdate=\"\npushd\ ~\/.oh-my-zsh\/custom\/plugins\/zsh-autosuggestions\/\ngit\ pull\npopd\npushd\ ~\/.oh-my-zsh\/custom\/plugins\/zsh-completions\/\ngit\ pull\npopd\npushd\ ~\/.oh-my-zsh\/custom\/plugins\/zsh-history-substring-search\/\ngit\ pull\npopd\npushd\ ~\/.oh-my-zsh\/custom\/plugins\/zsh-syntax-highlighting\/\ngit\ pull\npopd\npushd\ ~\/.oh-my-zsh\/custom\/themes\/powerlevel10k\/\ngit\ pull\npopd\nomz\ update\nexec\ zsh\n"/g' .zshrc
```

## Pacman (was möglich ist; not recommended)
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
```
sudo pacman -S fastfetch
```
Put at the beginning of `~/.zshrc`:
```
sleep 0.2
fastfetch --logo arch2
```
```
sed -i '1 i\sleep\ 0.2\nfastfetch\ --logo\ arch2' ~/.zshrc
```

## root
Für Root bietet sich eher ein "basic approach" an, um etwaige Fehler zu vermeiden.
1. Login to root
2. `chsh -s /usr/bin/zsh`
3. `exit`
4. login to root
5. nvim ~/.zshrc
6. Paste, save and `exit`:
```
autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
compinit
promptinit

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# This will set the default prompt to the clint theme
prompt clint

typeset -U path PATH
path=(~/.local/bin $path)
export PATH

zstyle ':completion:*' menu select

zstyle ':completion::complete:*' gain-privileges 1

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
autoload -Uz add-zle-hook-widget
function zle_application_mode_start { echoti smkx }
function zle_application_mode_stop { echoti rmkx }
add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
```
