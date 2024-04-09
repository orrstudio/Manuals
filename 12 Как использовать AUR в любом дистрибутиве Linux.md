# [Как использовать AUR в любом дистрибутиве Linux](https://www.youtube.com/watch?v=RHOcNRWiL4g)

## ⭐️ Команды создания Distrobox

```bash
distrobox-create -i archlinux --name arch
distrobox-create -i archlinux --name arch --nvidia
distrobox-create -i archlinux --name arch --init
distrobox-create -i archlinux --name arch --nvidia --init
```

## ⭐️ Команды удаления Distrobox

```bash
distrobox-stop arch
distrobox-rm arch
```

## ⭐️ Команды экспорта Distrobox

```bash
distrobox-export -a [application-name]
distrobox-export -b /usr/bin/[binary]
```

## ⭐️ Установка `yay`

```bash
pacman -S --needed git base-devel
git clone https:// aur . archlinux . org /yay.git
cd yay
makepkg -si
```

## ⭐️ Использование yay и pacman для установки программного обеспечения

```bash
yay [package-name]
pacman -Syu [package-name]
```

## ⭐️ Использование yay и pacman для удаления программного обеспечения и его зависимостей.
> ⚠️ Не используйте это в вашей хост-системе, так как это может привести к неработоспособности вашей системы. Внутри контейнера дистрибутива нет никакого вреда.

```bash
yay -Rs [packagename]
pacman -Rs [packagename]
```
