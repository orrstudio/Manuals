# Установка менеджера отображения GDM + GNOME + Wyland + PipeWire
## Достаточно поставить gdm и он потянет за собой минимальный GNOME + Wyland + PipeWire
```
sudo pacman -S gdm tilix
```
## Включение и запуск GDM (GNOME):
```
sudo systemctl start gdm
```
## Для дальнейшей настройки автоматического входа в систему:
```
sudo systemctl enable gdm
```
