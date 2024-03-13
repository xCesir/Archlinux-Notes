# Programme

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
