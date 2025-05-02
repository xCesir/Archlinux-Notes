# Basic Commands

## Paket-Manager [Pacman](https://wiki.archlinux.org/title/pacman)

## Updaten

```bash
pacman -Syu
```

## Installieren

```bash
pacman -S package_name1 package_name2 ...
```

## Entfernen

### Entfernen des Pakets
```bash
pacman -R package_name1 package_name2 ...
```

### Entfernen von Paket und nicht mehr benötigte Abhängigkeiten

```bash
pacman -Rs package_name1 package_name2 ...
```

### Entfernt Paket und Config-Files

```bash
pacman -Rn package_name1 package_name2 ...
```

### Entfernen von Paket mit Config-Files und nicht mehr benötigte Abhängigkeiten

```bash
pacman -Rns package_name1 package_name2 ...
```

## Pacman (Video Game Animation EasterEgg)

add `ILoveCandy` under `# Misc options` in `/etc/pacman.conf`

## Install all optional dependencies (not working correctly)
```bash
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

Das Arch Linux User Repository (AUR) ist eine von der Community gepflegte Sammlung von sogenannten _PKGBUILDs_ – also Bauanleitungen, mit deren Hilfe sich Programmpakete für Arch Linux erstellen lassen.\
Nach einer Registrierung kann jeder eigene Pakete im AUR veröffentlichen und so der Community zur Verfügung stellen. Dort finden sich vor allem „inoffizielle“ Pakete, die nicht im offiziellen Repository enthalten sind.

Bevor man AUR-Pakete installiert, sollte man unbedingt den Quellcode und das PKGBUILD überprüfen, um sich vor potenzieller Malware zu schützen. In manchen Fällen nutzen auch Entwickler das AUR als bequemen Verbreitungsweg ihrer Software (z. B. beim Tool _Portmaster_).

Zur Vereinfachung der Paketinstallation aus dem AUR gibt es sogenannte _Helper-Programme_. Der beliebteste und am weitesten verbreitete ist **yay**, das eine besonders umfassende Integration von Funktionen bietet (siehe [AUR Hilfsprogramme – ArchWiki](https://wiki.archlinux.de/title/AUR_Hilfsprogramme#Aktive_Projekte)).

### yay installieren

```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
sudo chown -R $(whoami) yay/
cd yay
makepkg -si
yay --version
cd ..
rm -rf yay/
```

### yay

yay funktioniert analog zu Pacman, sollte aber nie mit `sudo` ausgeführt werden.

#### Updaten

```bash
yay -Syu
```

#### Installieren
Während der Installation erscheinen zwei Abfragen, die beide mit `n` (Nein) beantwortet werden können:
- Die erste fragt, ob eine Binärdatei aus dem Quellcode erstellt werden soll.
- Die zweite betrifft die Ausgabe eines Änderungsverlaufs (Changelog) des Quellcodes.

```bash
yay -S package_name1 package_name2 ...
```

## Entfernen

### Entfernen des Pakets
```bash
yay -R package_name1 package_name2 ...
```

### Entfernen von Paket und nicht mehr benötigte Abhängigkeiten

```bash
yay -Rs package_name1 package_name2 ...
```

### Entfernt Paket und Config-Files

```bash
yay -Rn package_name1 package_name2 ...
```

### Entfernen von Paket mit Config-Files und nicht mehr benötigte Abhängigkeiten

```bash
yay -Rns package_name1 package_name2 ...
```
## [Snap](https://snapcraft.io/docs/installing-snap-on-arch-linux)
```bash
yay -S snapd apparmor
```
```bash
sudo systemctl enable --now snapd.socket
```
`lsm=landlock,lockdown,yama,integrity,apparmor,bpf` zu `/etc/kernel/cmdline` hinzufügen und `sudo mkinitcpio -P`, `sudo systemctl enable apparmor.service` dann neustarten.
Check `aa-enabled` sollte `Yes`zurückgeben,
```bash
sudo systemctl enable --now snapd.apparmor.service
```
check
```bash
sudo snap install hello-world
```
```bash
$ hello-world.evil 
Hello Evil World!
This example demonstrates the app confinement
You should see a permission denied error next
/snap/hello-world/29/bin/evil: 9: /snap/hello-world/29/bin/evil: cannot create /var/tmp/myevil.txt: Permission denied
```

```bash
sudo ln -s /var/lib/snapd/snap /snap
```
```bash
sudo snap install snap-store
```





