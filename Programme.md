# Programme

## GNUPG
````
sudo pacman -S gnupg kleopatra
````
````
echo "pinentry-program /usr/bin/pinentry-gnome3" > ~/.gnupg/gpg-agent.conf 
````
oder ohne safe-screen
````
echo "pinentry-program /usr/bin/pinentry-qt" > ~/.gnupg/gpg-agent.conf 
````
````
gpg-connect-agent reloadagent /bye
````

## [Nextcloud](https://wiki.archlinux.org/title/Nextcloud#Synchronization)
````
sudo pacman -S nextcloud-client
````

Es gibt optionale Deps, die nicht automatisch installiert werden.
Die Info zum Paket kann man mit `pacman -Qi nextcloud-client` auflisten. 

Installieren kann man die optionalen Pakete mit `pacman -S --asdeps`

Nextcloud arbeitet mit Tray-Icons, das kann unter Gnome nach installieren:
````
sudo pacman -S gnome-shell-extension-appindicator
````
oder kurz:
```
sudo pacman -S nextcloud-client
sudo pacman -S --asdeps kio nemo-python python-nautilus python-caja
sudo pacman -S gnome-shell-extension-appindicator
```
Dann ausloggen und wieder einloggen und in der Anwendung `Extensions` dann `Appindicator and KStatusNotifierItem Support` aktivieren
## Jetbrains

Zum installieren der Jetbrains Produkte stellt jetbrains die eigene Toolbox App auch unter Linux zu verfügumg als One-Click install file.
[Download](https://www.jetbrains.com/toolbox-app/)

## Portmaster by Sarfing

Gegen Tracking
[Website des Hersteller](https://safing.io/) <br>
[Quelle der Empfehlung](https://youtu.be/GkxAp2Gh7-E?si=seFlGxY91MBgu9ht&t=31) <br>
[AUR](https://aur.archlinux.org/packages/portmaster-stub-bin)

## Logseq
[Website des Hersteller](https://logseq.com/)

## fastfetch

wie Neofetch aber mit mehr Informationen

## Gnome Extension Manager

https://flathub.org/apps/com.mattjakeman.ExtensionManager

## GDM-Settings

https://aur.archlinux.org/packages/gdm-settings

## FIrewall UFW

https://wiki.archlinux.org/title/Uncomplicated_Firewall

````
sudo pacman -S ufw ufw-extras gufw
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw enable
````

## firejail

### setup

````
sudo pacman -S firejail firetools
````

### firefox example

````
firejail --private --dns=9.9.9.9 --dns=1.1.1.1 firefox -no-remote
````
oder
````
firejail --private --dns=1.1.1.1 --dns=9.9.9.9 firefox -no-remote
````
## Tor
````
sudo pacman -S torbrowser-launcher
````

### firejail example
````
firejail --private=~/.local/share/torbrowser/ --dns=9.9.9.9 --dns=1.1.1.1 torbrowser-launcher
````

## image [thumbnails](https://wiki.archlinux.org/title/File_manager_functionality#Thumbnail_previews)

````
sudo pacman -S tumbler
````

## LaTeX

````
sudo pacman -S gnome-latex texlive-binextra texlive-langgerman dblatex
````
## tldr
Ein tool mit Zusammenfassungen und Beispiele für Console Commands

````
sudo pacman -S tldr
````

### Beispiel
````
tldr sudo
````

## fzf
Command-line fuzzy finder
````
sudo pacman -S fzf
echo "source /usr/share/fzf/key-bindings.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source /usr/share/fzf/completion.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
````

## bat
Cat clone with syntax highlighting and git integration
````
sudo pacman -S bat bat-extras
````

### theFuck
Magnificent app which corrects your previous console command
````
sudo pacman -S thefuck
````

## Update Device Firmware
[Archwiki](https://wiki.archlinux.org/title/Fwupd#Usage)

## Audio Effekte
```
sudo pacman -S calf lsp-plugins-lv2 mda.lv2 zam-plugins-lv2 yelp easyeffect
```
oder Flathub (recommended)

## Eigene Application ohne Package Manager
Usually you should not have to try to install anything by hand. In almost all cases you will find a .deb package. If there isn't one, google for suggestions (like how to install Oracle JDK in Ubuntu). If this is your own software, check out the Ubuntu Packaging Guide for help on how to properly put stuff into Ubuntu.

If you must do it anyway, put the binary in /opt/myapp and link the executable with:
```
ln -s /opt/myapp/myappbinary /usr/local/bin/myappbinary
```
If you want to know more on the topic, type man hier in a terminal. The difference between `/usr/bin` and `/usr/local/bin` is explained there. In any case, both paths are in the `$PATH` environment variable. That means any binary you put there will be executable by anyone just by giving the name of the binary (and not the full path). So using the above example you can run your program with `myappbinary` instead of having to give the full path `/opt/myapp/myappbinary`.

[Quelle](https://askubuntu.com/questions/65728/where-to-install-software-and-executables-for-all-users)

für DE integrationen [hier](https://wiki.archlinux.org/title/desktop_entries)

## CoreCtrl

Zum steuern von AMD CPU und GPU
```
sudo pacman -S corectrl
```

## Docker
```
sudo pacman -S docker docker-compose
sudo systemctl enable docker.socket
sudo systemctl start docker.socket
sudo usermod -a -G docker $(logname)                                                                                                                                                                               newgrp docker
docker run -it --rm archlinux bash -c "echo hello world"
```
