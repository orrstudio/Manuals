# [Как использовать AUR в любом дистрибутиве Linux](https://www.youtube.com/watch?v=RHOcNRWiL4g)

## ⭐️ Команды создания контейнера в Distrobox

```bash
distrobox-create -i archlinux --name arch
distrobox-create -i archlinux --name arch --nvidia
distrobox-create -i archlinux --name arch --init
distrobox-create -i archlinux --name arch --nvidia --init
distrobox-create -i archlinux --name archlinux --nvidia --init --home ~/ArchHome
```

> Где:  
> --name archlinux - это название контейнера  
> --nvidia - загружает контейнера с драйвеоами Nvidia  
> --init - загружает контейнера с systemd  
> --home ~/ArchHome - создает контейнер со своей домашней директорией `ArchHome`  

## ⭐️ Команды запуска контейнера в Distrobox

```bash
distrobox enter archlinux
```

## ⭐️ Команды удаления контейнера из Distrobox

```bash
distrobox-stop arch
distrobox-rm arch
```

## ⭐️ Команды экспорта Distrobox приложений в вашу хост-систему

```bash
distrobox-export -a [application-name]
distrobox-export -b /usr/bin/[binary]
```

## ⭐️ Установка `yay` в контейнере Distrobox-а

```bash
pacman -S --needed git base-devel
git clone https:// aur . archlinux . org /yay.git
cd yay
makepkg -si
```

## ⭐️ Использование yay и pacman для установки программного обеспечения в контейнере Distrobox

```bash
yay [package-name]
pacman -Syu [package-name]
```

## ⭐️ Использование yay и pacman для удаления программного обеспечения и его зависимостей из контейнера Distrobox.
> ⚠️ Не используйте это в вашей хост-системе, так как это может привести к неработоспособности вашей системы. Используйте внутри контейнера Distrobox, это не нанесет никакого вреда вашей хост-системе.

```bash
yay -Rs [packagename]
pacman -Rs [packagename]
```
