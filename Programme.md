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

You can get this system information tool to output everything it can gather by using the command below.
```
fastfetch -c all.jsonc
```

## hyfetch
Neofetch/fastfetch with LGBTQ+ pride flags!

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
## bat
Cat clone with syntax highlighting and git integration
````
sudo pacman -S bat bat-extras
````

## fzf
Command-line fuzzy finder
````
sudo pacman -S fzf
echo "source /usr/share/fzf/key-bindings.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "source /usr/share/fzf/completion.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
echo "eval $(fzf --zsh)" >> ${ZDOTDIR:-$HOME}/.zshrc
````
### fzf with bat preview
````
fzf --preview 'bat --color=always {}'
````
create alias `fzf-preview` when using [omz](./ohmyzsh.md)
````
sed -ie s#alias\ ohmyzsh\=\"mate\ \~\/\.oh\-my\-zsh\"#alias\ ohmyzsh\=\"mate\ \~\/\.oh\-my\-zsh\"\\nalias\ fzf\-preview\=\"fzf\ \-\-preview\ \'bat\ \-\-color\=always\ \{\}\'\"# ~/.zshrc
````

### theFuck
Magnificent app which corrects your previous console command
````
sudo pacman -S thefuck
thefuck
fuck
fuck
````

## GDM-Settings

https://aur.archlinux.org/packages/gdm-settings


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
sudo usermod -a -G docker $(logname)
```
```
newgrp docker
docker run -it --rm archlinux bash -c "echo hello world"
```
## mediainfo
Supplies technical and tag information about media files
```
sudo pacman -S mediainfo mediainfo-gui
```

## [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)

```
sudo pacman -S kitty
```

Example [Config](./kittyconf.md)

## [TTE](https://github.com/ChrisBuilds/terminaltexteffects)

TerminalTextEffects (TTE) is a terminal visual effects engine, application, and Python library.

```
yay -S tte
```

## [locate](https://wiki.archlinux.org/title/Locate)


## [figlet](https://man.archlinux.org/man/figlet.6.en)

## MS Paint
```
sudo pacman -S kolourpaint
```

## Dolphin
### optional
```
sudo pacman -S --asdeps kimageformats shared-mime-info libavif ffmpegthumbs kde-cli-tools kdegraphics-thumbnailers kdenetwork-filesharing kio-admin purpose konsole
```

## dust
A more intuitive version of du in rust
```
sudo pacman -S dust
```

## gameconqueror
Memory scanner designed to isolate the address of an arbitrary variable in an executing process (gtk GUI)
```
sudo pacman -S gameconqueror
```
## usbguard
Software framework for implementing USB device authorization policies

## scrcpy
Display and control your Android device

[Github](https://github.com/Genymobile/scrcpy/tree/master)
```
sudo pacman -S scrcpy
```

## [coolercontrol](https://gitlab.com/coolercontrol/coolercontrol/)
### Prereq.
'y' for all
```
sudo pwmconfig 
```
'YES' for all
```
sudo pacman -S  i2c-tools
sudo modprobe i2c_dev
sudo modprobe at24
sudo sensors-detect 
```

Use your installed AUR Helper, i.e.:
```
# binary package
yay -S coolercontrol-bin

# source packag
yay -S coolercontrol
```

Then enable and start the systemd service:
```
sudo systemctl enable --now coolercontrold
```

## glow
Command-line markdown renderer
```
sudo pacman -S glow
```

## diff-so-fancy
Good-looking diffs with diff-highlight and more
```
sudo pacman -S diff-so-fancy
```

## tlp
Linux Advanced Power Management
```
sudo pacman -S tlp tlp-rdw
```

## imv
mpv like image viewer
```
sudo pacman -S imv
```

## goverlay
A GUI to help manage Vulkan/OpenGL overlays
```
sudo pacman -S goverlay
```
## OBS
### aur
```bash
yay -S obs-studio-git
```
### flatpak
```bash
flatpak install com.obsproject.Studio
```

## Freedesktop Platform
Stellt viele Pakete für andere Flathub Pakete Bereit wie z.B. MangoHUD oder streaming Encoder für OBS
```bash
flatpak search org.freedesktop.Platform
```

## [Identity](https://flathub.org/apps/org.gnome.gitlab.YaLTeR.Identity)
Identity ist ein Programm zum vergleichen von Photos und Videos.
```bash
flatpak install org.gnome.gitlab.YaLTeR.Identity
```


## Switcheroo
Convert between different image filetypes and resize them easily. 
```bash
flatpak install io.gitlab.adhami3310.Converter
```

## Speech Note
[Github](https://github.com/mkiol/dsnote)

### Gnome Extension Manager
```bash
flatpak install com.mattjakeman.ExtensionManager
```

## Master PDF Editor (flatpak)
Ein PDF Editor (selbstrechnender Charakterbogen für DSA5 [Das schwarze Auge])

## Decibels (flatpak)
Ein Audio Player

## Parabolic (flatpak)
Download web video and audio

## Flatseal

## Protontrick

## Protonup-qt

## ProtonPlus

## cpupower

## mission-center

## NoiseTorch

## heroic-games-launcher-bin

## r2modmanPlus

## gpt4all-chat

## bottles

  ## [Overlayed](https://flathub.org/apps/dev.overlayed.Overlayed)
