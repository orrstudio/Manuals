# Shares Obsidian Notes

# SYSTEM APPs

- [ ] Чтобы отображать лог загрузки Линукса, нужно раскоментировать в файле `/etc/systemd/system.conf` строку с надписью `ShowStatus=yes`
- [ ] [ЗАГРУЗОЧНЫ ДИСК SUPER GRUB2 2.04S1](https://www.supergrubdisk.org/category/download/supergrub2diskdownload/super-grub2-disk-stable/ "Это iso загрузочного диска для испорченных загрузок установленных систем линукс")
- [ ] [Boost Changer](https://github.com/nbebaw/boostchanger "Управляет турбонаддувом процессора и настройками скорости процессора")
- [ ] telnet (pacman -S inetutils)
- [ ] nman (программа для определения открытых портов сервера)
- [ ] Ventoy
- [ ] timeshift
- [ ] networkmanager-openvpn https://www.youtube.com/watch?v=2oCpjla-lw0
- [ ] MC
- [ ] FileZilla (FTP)
- [ ] GNOME Commander — двухпанельный файловый менеджер для Linux.
- [ ] File Roller (Archive Manager)
- [ ] NANO (Консольный Текстовый Редактор)
- [ ] [AstroVIM](https://www.youtube.com/watch?v=LKnuIazeiM4 "Это полноценная ИДЕ на основе NeoVIM со всеми нужными плагинами")
- [ ] TMUX
- [ ] foot - terminal
- [ ] TILIX
- [ ] lf как ranger
- [ ] lsix - photo in terminal
- [ ] hardinfo (Информация о системе и устройствах)
- [ ] Recoll — утилита для поиска файлов по содержимому. 
- [ ] Stacer — утилита для мониторинга, оптимизации, настройки и очистки системы.
- [ ] bash-completion
- [ ] xclip - буфер обмена для командной строки
- [ ] git или wget (Консольный Менеджер Закачки)
- [ ] [uGet Download Manager](https://ugetdm.com/ "Консольный и Графический Менеджер Закачки и Торрента")
- [ ] [uGet Integrator](https://github.com/ugetdm/uget-integrator "Интегрируйте uGet Download Manager с Google Chrome, Chromium, Opera, Vivaldi и Mozilla Firefox")
- [ ] MEGA 
- [ ] insync
- [ ] pCloud
- [ ] [Flameshot](https://github.com/flameshot-org/flameshot "Мощное, но простое в использовании программное обеспечение для создания скриншотов")
- [ ] [YAY](https://github.com/Jguer/yay "Помощник установки пакета из AUR") Чтобы включить цвет в YAY, нужно включить его в `/etc/pacman.conf` удалив `#` с пункта `Color`. Можно также увеличить количество скачивани в пункте `ParallelDownloads = 5` так же удалив `#`
- [ ] [CPM](https://github.com/willeccles/cpm "Обертка для менеджеров пакетов, для всех диструбутивов одинаковые команды.") Скачиваем zip файл распаковываем ставим галочку исполняемый (`chmod g+x cpm` `chmod u+x cpm`) и копируем в /usr/bin: `sudo cp cpm /usr/bin/`
- [ ] [PAMAC](https://gitlab.manjaro.org/applications/pamac "Графический менеджер пакетов для Arch Linux с поддержкой Alpm, AUR, Appstream, Flatpak и Snap")
- [ ] Google Chrome
- [ ] FireFOX
- [ ] OPERA
- [ ] [WhatsTron](https://vjba.github.io/whatstron "это настольный клиент WhatsApp для Linux, созданный с помощью Electron.") - WhatsApp для Linux
- [ ] [Telegram Desktop](https://desktop.telegram.org)
- [ ] [WINE](https://github.com/ferion11/Wine_Appimage "Appimage for Wine 32bits from PlayOnLinux - You can run on no-multilib system") - https://forum.puppylinux.com/viewtopic.php?t=1754
- [ ] [DOSBox](https://www.dosbox.com/)
- [ ] [hBlock](https://github.com/hectorm/hblock "Блокировщик рекламы и вредоносных доменов. Делает записи в /etc/hosts файле. После установки hBlock следует запустить в терминале: $ sudo hblock")
- [ ] [NTFS-3G](https://wiki.archlinux.org/title/NTFS-3G_%28%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%29 "Поддержка NTFS томов")
- [ ] [GUFW](http://gufw.org/ "FireWall для Linux") После установки включаем в автозапуск `systemctl enable ufw`
- [ ] [Oracle VM VirtualBox](https://www.virtualbox.org/ "Мощный продукт виртуализации x86 и AMD64/Intel64 для корпоративного и домашнего использования.")
- [ ] [Brasero](https://pingvinus.ru/program/brasero "Brasero — программа для записи дисков в Linux. Обладает всеми необходимыми функциями для записи и копирования дисков. Программа Brasero может записывать обычные CD/DVD диски с данными, звуковые диски, видеопроекты, образы дисков (iso и cue), копировать и форматировать диски.")
- [ ] [XAMPP Apache + MariaDB + PHP + Perl](https://www.apachefriends.org/ru/index.html "OpenServer для Linux")
- [ ] [Actiona](https://github.com/Jmgr/actiona "Макросы для Linux. Actiona - это инструмент автоматизации, который позволяет вам выполнять множество действий на вашем компьютере, таких как эмуляция щелчков мыши, нажатия клавиш, отображения окон сообщений, редактирования текстовых файлов и т. Д. Задачи можно создавать с помощью простого редактора или с помощью программирования EcmaScript (JavaScript). язык для дополнительной настройки. Actiona является кроссплатформенной.")
- [ ] ZSH & Oh My ZSH. Сначало ставим ZSH а потом Oh My ZSH потом fonts-powerline. После вводим в терминале `sudo usermod -s /bin/zsh orr` и тем самым делаем по умолчанию. Ставим плагины (yay -S zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search)[Как здесь](https://medium.com/macoclock/enhance-your-terminal-with-manjaros-zsh-config-ecada5b2897d) [Powerlevel10k ставим как здесь](https://gist.github.com/kevin-smets/8568070) [Еще инструкции здесь](https://habr.com/ru/post/323496/) 
- [ ] [neofetch](https://github.com/dylanaraps/neofetch "Neofetch отображает информацию о вашей операционной системе в терминале, программном и аппаратном обеспечении в эстетичном и визуально приятном виде. Для того чтобы неофетч запускался при открытии терминала нужно в конце файла ~/.bashrc или ~/.zshrc прописать neofetch. Дальше в конфиге неофетча можно скрыть или показать поля для отображения в терминале. Файл конфигурации содается при первом старте неофетч и находится в : ~/.config/neofetch/config.conf")
- [ ] Шрифты Microsoft
- [ ] [Ezanvakti](https://github.com/fbostanci/ezanvakti "GNU/Linux icin ezan vakti bildirici")
- [ ] [PowerMate](https://github.com/stefansundin/powermate-linux)
- [ ] [Altus](https://github.com/amanharwara/altus "Altus использует созданный GitHub фреймворк Electron, чтобы обернуть WhatsApp Web и добавить в него дополнительные функции.")
- [ ] [AppImageLauncher](joplin://x-callback-url/openNote?id=fabc4251115544d39e580e698cc2cae9)
- [ ] [Responsively App](https://responsively.app/download "Разрабатывайте адаптивные веб-приложения в 5 раз быстрее!")

# **GNOME INSTALLS**

## GNOME SYSTEM SETTINGS & APPs

- [ ] Gnome-control-center — центр управления
- [ ] gnome-tweaks (Дополнительные настройки GNOME)
- [ ] Темная тема Adwaita Dark предоставляется пакетом gnome-themes-extra (нужно установить)
- [ ] chrome-gnome-shell
- [ ] samba smbclient cifs-utils gvfs-smb [НАСТРОЙКИ SAMBA](:/a602a80044d04e96985794158b339d87)
- [ ] Fragments - torrent client for GNOME
- [ ] GtkHash - Hash summ for files GNOME
- [ ] Geary - email client for GNOME
- [ ] seahorse - Хранител паролей и создатель ключей SSH, PGP GNOME
- [ ] Webapp Manager - создает приложение из вэб страницы. GNOME
- [ ] To Do GNOME
- [ ] Снимок Экрана GNOME gnome-screenshot
- [ ] System Monitor GNOME (HTOP)
- [ ] Fonts GNOME
- [ ] GNOME system log
- [ ] ttf-freefont
- [ ] ttf-linux-libertine
- [ ] gnome-connections RDP


# GNOME EXTENSONs

- [ ] [Weather in The Clock](https://github.com/JasonLG1979/gnome-shell-extension-weather-in-the-clock/ "Отображение текущей погоды в часах.")
- [ ] [Системный монитор GNOME](https://github.com/mgalgs/gnome-shell-system-monitor-applet "Отображение информации в строке состояния GNOME (память, процессор, скорость интернета и т.д.")
- [ ] [GPaste](https://www.imagination-land.org/tags/GPaste.html "Система управления буфером обмена для GNOME 40 - (Clipboard management system)")
- [ ] [Net Speed Simpl](https://github.com/prateekmedia/netspeedsimplified "Это на тот случай если хочется видеть только скорость интернета  строке состояния рядом с часами.")
- [ ] KDE Connect


# [Как изменить размер tmp (tmpfs) налету](http://www.michurin.net/tools/remount-resize-tmpfs.html)

## Смотрим, сколько места у нас сейчас:

### Это команда покажет все
```
df -h
```

### Это команда покажет /tmp
```
df -h /tmp
```

### Это команда покажет /dev/shm
```
df -h /dev/shm
```
или эта
```
df -h | grep -Ei 'shm|size'
```

## А теперь увеличим нужную tmpfs в ручную без перезагрузки. Оно увеличится до следующей перезагрузки. Изменяем размер так:
```
mount -o remount,size=6G /tmp
```
и или
```
mount -o remount,size=6G /dev/shm
```

## Если захотите увеличить на постоянной основе придется колдовать в файле `/etc/fstab` нужно будет добавить строчку: 
```
tmpfs /dev/shm tmpfs defaults,rw,nodev,nofail,noatime,nosuid,size=6G 0 0 0
```
и или 
```
tmpfs /tmp tmpfs defaults,rw,nodev,nofail,noatime,nosuid,size=6G 0 0 0
```
