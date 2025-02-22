# Basic Commands

## Paket-Manager [Pacman](https://wiki.archlinux.org/title/pacman)

## Updaten

````
pacman -Syu
````

## Installieren

````
pacman -S package_name1 package_name2 ...
````

## Entfernen

### Entfernt Packet
````
pacman -R package_name
````

### Entfernt Packet und nicht mehr benötigte Dependencies

````
pacman -Rs package_name
````

## Pacman (Video Game Animation EasterEgg)

add `ILoveCandy` under `# Misc options` in `/etc/pacman.conf`

## Install all optional dependencies (not working correctly)
```
while IFS= read -r line; do
  if pacman -Qs $line > /dev/null ; then
    echo "The package $line is installed"
  else
    echo "The package $line is not installed"
    sudo pacman -S --asdeps --noconfirm $line
  fi
done < <(pacman -Qe | pacman -Si $1 | awk '/Optional Deps/,/Confli/' | sed '$d' | grep -o --extended-regexp "([A-Za-z0-9]+-)*[A-Za-z0-9]+:" | grep -o --extended-regexp "([A-Za-z0-9]+-)*[A-Za-z0-9]+")
```
## AUR und yay

Das ArchLinux User-Community Repository (AUR) ist eine Sammlung von Paketbau-Anleitungen (den PKGBUILDs) anhand derer Programmpakete für Arch Linux erstellt werden können.<br>
Jeder kann dort seine Pakete nach einer Registrierung veröffentlichen und anderen zur Verfügung stellen. Dort sind alle "inoffiziellen" Packete zu finden.<br>
Diese sollte man vor installation auf Malware überprüfen. Manchmal wird das AUR auch von den Entwicklern einer Software zur einfachen Veröffentlichung genutzt (siehe Portmaster).<br>
<br>
Um den User das installieren von AUR-Paketen zu vereinfachen gibt es Helper, der beliebteste ist yay. <br>
Yay hat hierbei die größte Integration von [featuren](https://wiki.archlinux.de/title/AUR_Hilfsprogramme#Aktive_Projekte).<br>

### yay installieren

````
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
sudo chown -R $(whoami) yay/
cd yay
makepkg -si
yay --version
````
Folder löschen, da nich länger benötigt
````
cd ..
rm -rf yay/
````

### yay

yay funktioniert analog zu Pacman, sollte aber nie mit `sudo` ausgeführt werden

#### Updaten

````
yay -Syu
````

#### Installieren
Im Rahmen der Installation kommt es zu zwei Abfragen beide können mit `n` abgeleht werden
- Die erste bezieht sich darauf, ob vom Source Code die Binary gebaut werden soll.
- Die zweite, ob ein Änderungsverlauf des Source Code Ausgeben werden soll.

````
yay -S package_name1 package_name2 ...
````

#### Entfernen

##### Entfernt Packet
````
yay -R package_name
````

##### Entfernt Packet und nicht mehr benötigte Dependencies

````
yay -Rs package_name
````

## Merge folder
```
rsync -avh source destination
```
## [Snap](https://snapcraft.io/docs/installing-snap-on-arch-linux)
