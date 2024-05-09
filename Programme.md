# Programme

## GNUPG
````
sudo pacman -Ss gnupg kleopatra
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

## image [thumbnails](https://wiki.archlinux.org/title/File_manager_functionality#Thumbnail_previews)

````
sudo pacman -S tumbler
````

## LaTeX

````
sudo pacman -S gnome-latex texlive-binextra texlive-langgerman dblatex
````

## Update Device Firmware
[Archwiki](https://wiki.archlinux.org/title/Fwupd#Usage)

## Audio Effekte
```
sudo pacman -S calf lsp-plugins-lv2 mda.lv2 zam-plugins-lv2 yelp easyeffect
```
