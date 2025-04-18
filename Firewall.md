# Firewall 

## firewalld (recommended)
```bash
sudo pacman -S firewalld
sudo systemctl enable firewalld.service
sudo systemctl start firewalld.service
```

### firewalld QT tray applet
```bash
sudo pacman -S python-pyqt5
```
## [UFW](https://wiki.archlinux.org/title/Uncomplicated_Firewall)

```bash
sudo pacman -S ufw ufw-extras gufw
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw enable
```
Note: Kann zu Problemen bei libvirt Verbindungen führen (Stand 2024-06-07) die für VM nötig sind

