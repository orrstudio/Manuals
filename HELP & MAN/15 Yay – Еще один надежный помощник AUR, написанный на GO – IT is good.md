# install YAY on Arch Linux
## Update your system: 
```
$ **sudo pacman -Syyu**
```
## Install Git:
```
$ **sudo pacman -S git**
```
## Next, clone the yay git repository:
```
$ **cd /opt**
$ **sudo git clone https://aur.archlinux.org/yay.git**
```
## Change the file permissions from the root the sudo user.
```
$ **sudo chown -R orr:orr ./yay**
```
## To build the package from PKGBUILD, navigate into the yay folder.
```
**$ cd yay**
```
## Next, build the package using the makepkg command below.
```
**$ makepkg -si**
```
## Once you have yay installed, you can upgrade all the packages on your system using the command.
```
**$ sudo yay -Syu**
```
## To include development packages during the upgrade run.
```
**$ yay -Syu --devel --timeupdate**
```
## For **install** a package using yay use the command:
```
**$ sudo yay -S gparted**
```
## For **remove** a package using yay use the command:
```
**$ sudo yay -Rns package_name**
```
## To clean up all unwanted dependencies on your system, issue the command:
```
**$ sudo yay -Yc**
```
## If you want to print system statistics using yay, run:
```
**$ sudo yay -Ps**
```
</br></br></br>

# Yay – Еще один надежный помощник AUR, написанный на GO – IT is good

# Установка
## Чтобы установить Yay на любые системы на базе Arch, выполните следующие команды один за другим.
```
$ sudo pacman -S git
yay - стабильная версия yay-git - версия для разработки
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```
</br></br></br>

# Использование
## Как и любые другие помощники AUR, типичный способ установки пакета из AUR:
```
$ yay -S mplayer
```
## Чтобы найти пакет в AUR и официальных репозиториях, используйте флаг -Ss, как показано ниже.
```
**$ yay -Ss mplayer** 
```
## Мы также можем просмотреть информацию о пакете в AUR или официальных репозиториях.
```
**$ yay -Si mplayer** 
```
## Чтобы обновить все пакеты из AUR и официальных репозиториев, используйте флаг -Syu.
```
$ yay -Syu
```
## Хорошей особенностью yay является то, что если вы передаете эту команду без операции, тогда отобразится меню выбора пакета.
## Например, когда я запускаю следующую команду (обратите внимание, что нет указанной операции), она показывает мне меню выбора пакета.
```
$ yay mplayer
```
## Мне нужно было ввести номер для установки соответствующего пакета.
## Кроме того, мы можем указать несколько пакетов с разделением пространства.
## Чтобы установить любые пакеты без подтверждения (без вмешательства пользователя, конечно), используйте опцию «-noconfirm».
```
$ yay -S --noconfirm &lt;package-name&gt;
```
## Чтобы вывести список пакетов, которые необходимо обновить, выполните:
```
**$ yay -Pu** 
```
### Чтобы удалить нежелательные зависимости, используйте флаг -Yc, как показано ниже.
```
**$ yay -Yc** 
```
## Более подробную информацию о yay см. В справочных страницах.
```
$ man yay
```