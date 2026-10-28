# YAY – Пакетный менеджер [AUR](https://aur.archlinux.org/)

> Пакетным менеджером по-умолчанию для Arch Linux является Pacman. 

## Установка YAY
```bash
sudo pacman -Syyu
sudo pacman -S git
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
sudo chown -R orr:orr ./yay-bin
cd yay-bin
makepkg -si
sudo yay -Syu
```

## Настройки YAY
Чтобы включить цветную подсветку в "YAY" и "pacman" раскомментируйте в `/etc/pacman.conf`  пункт `Color` удалив `#` перед ним. 
Чтобы увеличить количество скачивани раскомментируйте в `/etc/pacman.conf`  пункт  `ParallelDownloads = 5`  удалив `#` перед ним. 

## Работа с Пакетами

### Установить пакет
```bash
yay -S <package>
```
### Удалить пакет
```bash
yay -Rns <package>
```
### Обновить все установленные пакеты
```bash
yay -Syu
```
### Обновить в т.ч. с пакетами для разработчика
```bash
yay -Syu --devel --timeupdate
```
### Очистить кеш
```bash
yay -Sc
```
### Удалить все ненужные зависимости
```bash
yay -Yc
```
### Статистика по пакетами
```bash
yay -Ps
```
### Создает базу данных пакета разработки, используемую для обновлений разработки.
```bash
yay -Y --gendb
```
