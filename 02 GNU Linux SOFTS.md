<img src="https://user-images.githubusercontent.com/65281943/215001207-d1a0f318-2a85-468a-b391-fd55e569dc9f.png" height="300" align="middle">

[List of Arch Linux applications](https://wiki.archlinux.org/title/List_of_applications#top-page "Эта статья представляет собой общий список приложений, отсортированных по категориям, в качестве справки для тех, кто ищет пакеты. Многие разделы разделены между консольными и графическими приложениями.")

# ОГЛАВЛЕНИЕ

- [SYSTEM APPS](#system-apps)
  - [BOOT](#boot)
  - [NETWORK](#network)
  - [SYSTEM TOOLS](#system-tools)
  - [COMMANDERS](#commanders)
  - [TERMINAL](#terminal)
  - [INTERNET](#internet)
  - [SECURITY](#security)
  - [SETTINGS Aplications for GNOME](#settings-aplications-for-gnome)
  - [EXTENSIONS for GNOME](#extensions-for-gnome)
- [OFFICE SOFTS](#office-softs)
- [E-BOOKS](#e-books)
- [AUDIO & VIDEO](#audio--video)
- [PHOTO](#photo)
- [DEVELOPE](#develope)
- [GAMES](#games)
- [Список приложений GNOME](#%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9-gnome)
- [NEW SOFT NOT TESTED](#new-soft-not-tested)

# SYSTEM APPS

## BOOT

- [Ventoy](https://github.com/ventoy/Ventoy "A new bootable USB solution.")
- Чтобы отображать лог загрузки Линукса, нужно раскоментировать в файле `/etc/systemd/system.conf` строку с надписью `ShowStatus=yes`
- [ЗАГРУЗОЧНЫ ДИСК SUPER GRUB2 2.04S1](https://www.supergrubdisk.org/category/download/supergrub2diskdownload/super-grub2-disk-stable/ "Это iso загрузочного диска для испорченных загрузок установленных систем линукс")
- [Boost Changer](https://github.com/nbebaw/boostchanger "Управляет турбонаддувом процессора и настройками скорости процессора")

## NETWORK

- [What IP](https://flathub.org/ru/apps/org.gabmus.whatip "Информация о вашем IP")
- telnet (pacman -S inetutils)
- nman (программа для определения открытых портов сервера)
- networkmanager-openvpn https://www.youtube.com/watch?v=2oCpjla-lw0
- samba smbclient cifs-utils gvfs-smb — [MANUAL для настройки сети SAMBA](https://github.com/orrstudio/My-Notes-and-Manuals/blob/main/03%20HELP%20%26%20MAN/11%20SAMBA%20(%D0%9D%D0%90%D0%A1%D0%A2%D0%A0%D0%9E%D0%99%D0%9A%D0%98).md)
- FileZilla (FTP)
- [TOR PROXY](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=10) - Ставим [GNOME Proxy Switcher](https://extensions.gnome.org/extension/771/proxy-switcher/) Если нету [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep) то ставим его чтобы включать дополнения прямо из браузера. Потом ставим [TOR](https://wiki.archlinux.org/title/tor) в терминале. Включаем тор в терминале под рутом и настраиваем GNOME Proxy Switcer как показано в видео. Ползуемсю.
- [sshuttle](https://github.com/sshuttle/sshuttle "Прокси-сервер, который работает как VPN форвард по ssh. Не требует админ. Работает с Linux и MacOS. Поддерживает туннелирование DNS.") - (Ставим sshuttle на клиенте и запускаем в терминале: sshuttle -vvvv -r ubuntu@168.188.188.188 -x 168.188.188.188 0/0)
- [IP Lookup](https://flathub.org/ru/apps/io.github.bytezz.IPLookup "Найти информацию об IP-адресе интернет-провайдерa, географическое положение IP-адреса и т.д.")

## SYSTEM TOOLS

- [Distrobox - Используйте любой дистрибутив Linux внутри своего терминала](https://github.com/89luca89/distrobox)
- [Flatseal - Утилита управления разрешениями Flatpak (flatseal)](https://flathub.org/ru/apps/com.github.tchx84.Flatseal "Это графическая утилита для просмотра и изменения разрешений ваших приложений Flatpak.")
- [PulseAudio Volume Control (pavucontrol)](https://flathub.org/ru/apps/org.pulseaudio.pavucontrol "Это инструмент управления громкостью («микшер») для звукового сервера PulseAudio. В отличие от классических инструментов микшера, этот позволяет вам управлять громкостью как аппаратных устройств, так и каждого потока воспроизведения в отдельности.")
- [File manager functionality](https://wiki.archlinux.org/title/File_manager_functionality_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) "Монтирование цифровых фотоаппаратов и мобильных устройств и многое другое")
- dconf-editor \ # все настройки gnome в одном месте
- hardinfo (Информация о системе и устройствах)
- timeshift
- Stacer — утилита для мониторинга, оптимизации, настройки и очистки системы.
- Шрифты
- [gerb](https://github.com/epilys/gerb "font editor")
- [Flameshot](https://github.com/flameshot-org/flameshot "Мощное, но простое в использовании программное обеспечение для создания скриншотов")
- [PAMAC](https://gitlab.manjaro.org/applications/pamac "Графический менеджер пакетов для Arch Linux с поддержкой Alpm, AUR, Appstream, Flatpak и Snap")
- [YAY](https://github.com/Jguer/yay "Помощник установки пакета из AUR") Чтобы включить цвет в YAY, нужно включить его в `/etc/pacman.conf` удалив `#` с пункта `Color`. Можно также увеличить количество скачивани в пункте `ParallelDownloads = 5` так же удалив `#`
- [CPM](https://github.com/willeccles/cpm "Обертка для менеджеров пакетов, для всех диструбутивов одинаковые команды.") Скачиваем zip файл распаковываем ставим галочку исполняемый (`chmod g+x cpm` `chmod u+x cpm`) и копируем в /usr/bin: `sudo cp cpm /usr/bin/`
- [WINE](https://github.com/ferion11/Wine_Appimage "Appimage for Wine 32bits from PlayOnLinux - You can run on no-multilib system") - https://forum.puppylinux.com/viewtopic.php?t=1754
- [DOSBox](https://www.dosbox.com/)
- [NTFS-3G](https://wiki.archlinux.org/title/NTFS-3G_%28%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%29 "Поддержка NTFS томов")
- QEMU - [Video Install 1](https://www.youtube.com/watch?v=Izxng1e67KE&list=PL6gG7zVB_EJxCYuQAKMwWXZqxED7FAesN&index=4) [Video Install 2](https://www.youtube.com/watch?v=h4M36yHjnLM&list=PLjW32vCGNUuY7fcnkEjeHZPtr3Gibswb9&index=14) yay -Sy libvirt virt-manager qemu extra/qemu-arch-extra extra/qemu-guest-agent dnsmasq edk2-ovmf iptables ebtables dmidecode
- [Oracle VM VirtualBox](https://www.virtualbox.org/ "Мощный продукт виртуализации x86 и AMD64/Intel64 для корпоративного и домашнего использования.")
- [Brasero](https://pingvinus.ru/program/brasero "Brasero — программа для записи дисков в Linux. Обладает всеми необходимыми функциями для записи и копирования дисков. Программа Brasero может записывать обычные CD/DVD диски с данными, звуковые диски, видеопроекты, образы дисков (iso и cue), копировать и форматировать диски.")
- [Actiona](https://github.com/Jmgr/actiona "Макросы для Linux. Actiona - это инструмент автоматизации, который позволяет вам выполнять множество действий на вашем компьютере, таких как эмуляция щелчков мыши, нажатия клавиш, отображения окон сообщений, редактирования текстовых файлов и т. Д. Задачи можно создавать с помощью простого редактора или с помощью программирования EcmaScript (JavaScript). язык для дополнительной настройки. Actiona является кроссплатформенной.")
- [PDF4QT](https://flathub.org/ru/apps/io.github.JakubMelka.Pdf4qt "для просмотра/редактирования PDF-файлов")
- [AppImageLauncher](joplin://x-callback-url/openNote?id=fabc4251115544d39e580e698cc2cae9)
- [PowerMate](https://github.com/stefansundin/powermate-linux "Linux userspace driver for the Griffin PowerMate. (For the classic USB model. There is a proof-of-concept for the Bluetooth model.)")
- [CPU-X](https://flathub.org/ru/apps/io.github.thetumultuousunicornofdarkness.cpu-x "Собирает информацию о процессоре, материнской плате и многом другом.")
- [Adobe Reader](https://flathub.org/ru/apps/com.adobe.Reader "официальное программное обеспечение Adobe для просмотра, печати и аннотирования PDF-документов.")
- [Shortcut](https://flathub.org/ru/apps/io.github.andreibachim.shortcut "Сделайте ярлыки приложений")
- [Distrobox](https://github.com/89luca89/distrobox "Контейнер с дистрибутивом Linux")
- [Easy Effects](https://github.com/wwmm/easyeffects?tab=readme-ov-file "Easy Effects — это продвинутый инструмент для манипуляций со звуком. ")
- [PeaZip](https://peazip.github.io/peazip-linux.html "МЕНЕДЖЕР АРХИВОВ ДЛЯ LINUX")

## COMMANDERS

- MC - файловый менеджер для Linux.
- GNOME Commander — двухпанельный файловый менеджер для Linux.
- File Roller — Archive Manager
- lf — терминальны файловый менеджер для Linux.
- ranger — терминальны файловый менеджер для Linux.

## TERMINAL

- [rubin](https://github.com/BiteDasher/rubin "Исправлялка команд написанных по-английски на русской раскладке ")
- [INTELLI-SHELL](https://github.com/lasantosr/intelli-shell "IntelliShell действует как хранилище закладок для команд, поэтому вам не нужно поддерживать чистоту истории, чтобы иметь возможность найти что-то полезное с ctrl + R. ")
- [Translate Shell](https://www.soimort.org/translate-shell/ "Переводчик командной строки")
- [SSHUTTLE]() - VPN через SSH (Для подключения сначало ставим саму прогу `sshuttle`, а потом вводим в терминале: `sshuttle -vvvv -r ubuntu@168.188.188.88 -x 168.188.188.88 0/0)` для подключения. [VIDEO TUTORIAL](https://www.youtube.com/watch?v=7XDOuH-MPvw)
- NANO (Консольный Текстовый Редактор)
- [AstroVIM](https://www.youtube.com/watch?v=LKnuIazeiM4 "Это полноценная ИДЕ на основе NeoVIM со всеми нужными плагинами")
- [Vim color themes](https://vimcolorschemes.com/dark/)
- duf - аналог df но красивше. Показывает информацию про диски в табличной форме.
- TMUX
- tree - утилита показывающая дерево каталогов и файлов в терминале.
- foot - terminal
- TILIX
- lsix - photo in terminal
- Recoll — утилита для поиска файлов по содержимому.
- bash-completion
- xclip - буфер обмена для командной строки
- git или wget (Консольный Менеджер Закачки)
- [cloudcross](https://cloudcross.mastersoft24.ru/ "CloudCross — это проект с открытым исходным кодом для синхронизации между вашими устройствами и различными облачными хранилищами. Такими как: GoogleDrive, OndeDrive, Dropbox, ЯндексДиск и Mail.Ru")
```bash
ccross -a # Cloud provider athentication
ccross --prefer local # Can be one of "local" or "remote". "remote" - for priority of google-drive, and "locl" for local folder priority.
ccross --dry-run # shows which files will be loaded/unloaded, but really do not synchronize
ccross -p /home/orr/Downloads/google-drive # the absolute path to synchronize directory. And synchronizing command.
ccross # For synchronization, you enough run.
```
- [uGet Download Manager](https://ugetdm.com/ "Консольный и Графический Менеджер Закачки и Торрента")
- [uGet Integrator](https://github.com/ugetdm/uget-integrator "Интегрируйте uGet Download Manager с Google Chrome, Chromium, Opera, Vivaldi и Mozilla Firefox")
- ZSH & Oh My ZSH. Сначало ставим ZSH а потом Oh My ZSH потом fonts-powerline. После вводим в терминале `sudo usermod -s /bin/zsh orr` и тем самым делаем по умолчанию. Ставим плагины (yay -S zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search)[Как здесь](https://medium.com/macoclock/enhance-your-terminal-with-manjaros-zsh-config-ecada5b2897d) [Powerlevel10k ставим как здесь](https://gist.github.com/kevin-smets/8568070) [Еще инструкции здесь](https://habr.com/ru/post/323496/)
- [neofetch](https://github.com/dylanaraps/neofetch "Neofetch отображает информацию о вашей операционной системе в терминале, программном и аппаратном обеспечении в эстетичном и визуально приятном виде. Для того чтобы неофетч запускался при открытии терминала нужно в конце файла ~/.bashrc или ~/.zshrc прописать neofetch. Дальше в конфиге неофетча можно скрыть или показать поля для отображения в терминале. Файл конфигурации содается при первом старте неофетч и находится в : ~/.config/neofetch/config.conf")
- [SSHMenu Utility](https://github.com/Orr888/SSHMenu "Сценарий Bash для управления вашими ssh-соединениями, который создает меню (через диалог в терминале) из вашего файла ~/.ssh/config.")

## INTERNET

- Google Chrome
- FireFOX
- OPERA
- [CrowTranslate](https://flathub.org/ru/apps/io.crow_translate.CrowTranslate "Crow Translate — это простой и легкий переводчик, написанный на C++/Qt, который позволяет вам переводить и озвучивать текст с помощью Google, Yandex, Bing, LibreTranslate и Lingva translate API.")
- MEGA
- insync
- pCloud
- [WhatsTron](https://vjba.github.io/whatstron "это настольный клиент WhatsApp для Linux, созданный с помощью Electron.") - WhatsApp для Linux
- [Telegram Desktop](https://desktop.telegram.org)
- [WhatsApp для Linux](https://flathub.org/ru/apps/com.github.eneshecan.WhatsAppForLinux "WhatsApp для Linux — это неофициальное настольное приложение WhatsApp, написанное на C++.")
- [XAMPP Apache + MariaDB + PHP + Perl](https://www.apachefriends.org/ru/index.html "OpenServer для Linux")
- [Proxy Switcher в GNOME и сеть Tor](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=8)
- [Youtube Downloader Plus](https://flathub.org/ru/apps/io.github.aandrew_me.ytdn "Скачивайте видео и аудио с сотен сайтов")

## SECURITY

- [PASS](https://www.passwordstore.org/ "Менеджер паролей - скрипт для gpg")
  - [Полное описание установки PASS и GPG](https://habr.com/ru/post/479540/)
  - GUI для GPG [Seahorse](https://wiki.gnome.org/Apps/Seahorse "Приложение для управления паролями, а так же PGP и SSH ключами")
  - GUI для Pass [QtPass](https://qtpass.org/) 
  - GUI для Pass и GPG [Kleopatra](https://apps.kde.org/kleopatra/)
  - [PASS IMPORT](https://github.com/roddhjav/pass-import#readme "это утилита импорта паролей из сторонних баз паролей.")
  - Pасширение для браузера Google Chrome [Browserpass](https://github.com/browserpass)
    - Для установки Browserpass, необходимо установить два его компонента: 
    - [browserpass-extension - Браузерное расширение](https://chromewebstore.google.com/detail/browserpass/naepdomgkenhinolocfifgehidddafch)
    - [browserpass-native - Клиентское приложение](https://github.com/browserpass/browserpass-native#installation)
  - Pасширение для браузера FireFox [PassFF](https://github.com/passff)
    - Для установки PassFF, необходимо установить два его компонента:
    - [PassFF - Браузерное расширение](https://addons.mozilla.org/ru/firefox/addon/passff/)
    - [PassFF Хост-приложение для WebExtension](https://github.com/passff/passff-host)
- [GUFW](http://gufw.org/ "FireWall для Linux") - После установки включаем в автозапуск `systemctl enable ufw`
- [hBlock](https://github.com/hectorm/hblock "Блокировщик рекламы и вредоносных доменов. Делает записи в /etc/hosts файле.") - После установки hBlock следует запустить в терминале: ($ sudo hblock) Для временного отключения hBlock введите в терминале: ($ sudo hblock -S none -D none)
- [Portmaster](https://github.com/safing/portmaster/?tab=readme-ov-file "Aвтоматически блокирует рекламу, трекеры и вредоносные программы на всем вашем устройстве.")
- [firejail](https://github.com/netblue30/firejail "ПЕСОЧНИЦА для линукс") - [доп инфа в видео](https://www.youtube.com/watch?v=OWu5RNWjhEc)

## SETTINGS Aplications for GNOME

- gnome-control-center — Центр управления для GNOME
- gnome-tweaks — Дополнительные настройки GNOME
- Adwaita Dark — Темная тема для GNOME (предоставляется пакетом gnome-themes-extra)
- chrome-gnome-shell — Надстрока для GNOME Extensions (Позволяет устанавливать Gnome "extensions" через Хром браузер)
- fragments - torrent client for GNOME
- Transmission - torrent client 
- GtkHash - Hash summ files for GNOME
- feary - email client for GNOME
- seahorse - Хранител паролей и создатель ключей SSH, PGP для GNOME
- Webapp Manager - создает приложение из вэб страницы для GNOME
- gnome-screenshot — Снимок Экрана GNOME
- System Monitor — GNOME (HTOP)
- fonts — for GNOME
- system log — for GNOME
- gnome-connections — RDP for GNOME

## EXTENSIONS for GNOME

<img src="https://raw.githubusercontent.com/andyholmes/gnome-shell-extensions-badge/master/get-it-on-ego.svg?sanitize=true" alt="Get it on GNOME Extensions" height="100" align="middle">

[10 лучших расширений GNOME - Video](https://www.youtube.com/watch?v=AllSHTrR6ro)

- [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/ "Tweak Tool to Customize GNOME Shell")
- [Tiling-Assistant](https://extensions.gnome.org/extension/3733/tiling-assistant/ "")
- [Munadi - Simple Athan App](https://flathub.org/ru/apps/org.munadi.Munadi)
- [Vakt-i Salah](https://flathub.org/ru/apps/io.github.eminfedar.vaktisalah-gtk-rs "Приложение Prayer Times на базе Rust и GTK4. Он использует время молитв турецкого Управления по делам религии (Diyanet İşleri Başkanlığı)")
- [Azan Islamic Prayer Times](https://extensions.gnome.org/extension/1510/azan-islamic-prayer-times/)
- [Muezzin](https://github.com/DBChoco/Muezzin "Приложение «Время молитвы» (Азан) и Коран для Windows, macOS и GNU/Linux.")
- [Azan Islamic Prayer Times](https://github.com/fahrinh/azan-gnome-shell-extension "Азан для Gnome Shell. ")
- [OpenWeather](https://extensions.gnome.org/extension/750/openweather/ "Отображение прогноза погоды в строке состояния GNOME.")
- [Weather O'Clock](https://extensions.gnome.org/extension/5470/weather-oclock/ "Display the current weather inside the pill next to the clock. GNOME Weather is required for this extension to work.")
- [Vitals](https://github.com/corecoding/Vitals "Отображение информации в строке состояния GNOME (память, процессор, скорость интернета и т.д.")
- [TopHat](https://extensions.gnome.org/extension/5219/tophat "TopHat отображает активность процессора, памяти, диска и сети в верхней панели GNOME.")
- [GPaste](https://www.imagination-land.org/tags/GPaste.html "Система управления буфером обмена для GNOME 40 - (Clipboard management system)")
- [Net Speed Simpl](https://github.com/prateekmedia/netspeedsimplified "Виджет на температуру, скорость интернета, использование памяти и загрузку процессора.")
- [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect "GSConnect - это полная реализация KDE Connect специально для GNOME Shell с интеграцией Nautilus, Chrome и Firefox. Он не зависит от настольного приложения KDE Connect и не будет работать с установленным приложением. KDEConnect позволяет устройствам безопасно обмениваться контентом, например, уведомлениями или файлами, а также использовать другие функции, такие как SMS-сообщения и удаленное управление. Команда KDE Connect имеет приложения для Linux, BSD, Android, Sailfish, iOS, macOS и Windows.")
- [GNU/Linux icin ezan vakti bildirici](https://github.com/fbostanci/ezanvakti)
- [DownFall](https://extensions.gnome.org/extension/3539/downfall/ "Имитирует листья, снег, фейерверки, НЛО и многое другое!")

# OFFICE SOFTS

- [Libre Office](https://ru.libreoffice.org "LibreOffice — мощный офисный пакет, полностью совместимый с 32/64-битными системами. Переведён более чем на 30 языков мира. Поддерживает большинство популярных операционных систем, включая GNU/Linux, Microsoft Windows и Mac OS X.")
- [CherryTree](https://www.giuspen.com/cherrytree/ "Приложение для создания иерархических заметок с богатым текстом и подсветкой синтаксиса, хранящее данные в одном файле xml или sqlite.")
- [Gromit-MPX](https://github.com/bk138/gromit-mpx "Это инструмент для экранных аннотаций, который работает с любой средой рабочего стола Unix под X11, а также с Wayland. Его основное использование для создания презентаций некоторых приложений. Обычно вам нужно будет перемещать указатель мыши вокруг точки интереса, пока все не заметят ее. С Gromit-MPX вы можете рисовать везде на экране, выделяя какую-то кнопку или область. Для установки используем yay -S gromit-mpx")
- [Apostrophe - Edit Markdown in style](https://flathub.org/ru/apps/org.gnome.gitlab.somas.Apostrophe)

# E-BOOKS

- [Sigil & PageEdit](https://sigil-ebook.com/ "Sigil - Редактор электронных книг EPUB / PageEdit - это редактор WYSIWYG XHTML, предназначенный как приложение Sigil Companion.")
- [Thorium](https://github.com/edrlab/thorium-reader/releases "Кроссплатформенное desktop-ное приложение для чтения электронных книг EPUB")

# AUDIO & VIDEO

- [SMPlayer](https://www.smplayer.info/en/downloads "SMPlayer — безплатный медиаплеер для Windows и Linux со встроенными кодеками, поддерживающий практически все форматы видео и аудио. А главное это TouTube без РЕКЛАМЫ")<br/>For install:<br/>`yay -S smplayer`<br/>For Dark Theme:<br/>`yay -S smplayer-themes`<br/>`yay -S smplayer-skins`
- [SHOTCUT](https://shotcut.org/download/ "SHOTCUT - Программа для видео и фото монтажа") [Релизы](https://github.com/mltframework/shotcut "Релизы на GITHUB")
- [youtube-dl-gui](https://github.com/jely2002/youtube-dl-gui/releases/tag/v2.2.2 "youtube-dl-gui")
- [HandBrake](https://handbrake.fr/ "HandBrake - Транскодер
видео")
- [FF Multi Converter](https://sites.google.com/site/ffmulticonverter/home "Конвертер аудио, видео, изображений и документов между всеми популярными форматами")
- [ocenaudio](https://www.ocenaudio.com/ "Это идеальное программное обеспечение для людей, которым необходимо редактировать и анализировать аудиофайлы без каких-либо сложностей. ")
- [Reaper](https://www.reaper.fm)
- [VoiceGen](https://flathub.org/ru/apps/io.gitlab.persiangolf.voicegen "преобразовывать текст в речь")
- [Kid3](https://kid3.kde.org "Редактoр тегoв audio файлoв")
- Audacious — WINAMP
- OBS Studio - Программа для записи экрана.
- Hypnotix - Ip TV
- [Ardour](https://ardour.org/ "Программа для многоканальной записи звука и цифровая звуковая станция в одном.")

# PHOTO

- [gThumb](https://pingvinus.ru/program/gthumb "Программа просмотра изображений для рабочего стола GNOME")
- [darktable](https://www.darktable.org/ "Приложение для обработки фотографий")
- [Gimp](https://www.gimp.org/ "Программа для создания и обработки растровой графики и частичной поддержкой работы с векторной графикой")
- [Inkscape](https://inkscape.org/)
- [Krita](https://krita.org/en/)
- [ColorPicker](https://colorpicker.fr "это настольный инструмент с Electron для быстрого получения и сохранения кода цветов для OS X, Windows и Linux!")
- [MyPaint](https://github.com/mypaint/mypaint/releases/tag/v2.0.1 "MyPaint - это простая программа для рисования и рисования, которая хорошо работает с графическими планшетами в стиле Wacom.")
- [VPaint](https://github.com/dalboris/vpaint "это экспериментальный прототип , основанный на комплексе векторной графики (VGC). Он позволяет создавать иллюстрации и анимацию, не зависящие от разрешения, с использованием инновационных технологий.")
- [Photoflare](https://photoflare.io/ "Photoflare вдохновлен редактором изображений, который в настоящее время доступен только в Microsoft Windows")
- [Share Screen Shots](https://pastenow.ru "Делиться скринами в интернете")
- [Online конвертер иконок favicon.ico из формата PNG](http://www.michurin.net/online-tools/favicon-converter.html)
- [Pencil2D Animation](https://www.pencil2d.org/download/ "Простой, интуитивно понятный инструмент для создания рисованной 2D-анимации.")
- [Synfig Studio](https://www.synfig.org/)
- [Eyedropper](https://github.com/FineFindus/eyedropper "New Color Picker for GNOME")
- ksnip - Инструмент для создания и аннотирования снимков экрана
- [digiKam](https://www.digikam.org/download/ "digiKam — это усовершенствованное приложение для управления цифровыми фотографиями с открытым исходным кодом, работающее на Linux, Windows и macOS. Приложение предоставляет полный набор инструментов для импорта, управления, редактирования и обмена фотографиями и необработанными файлами.")

# DEVELOPE

- [GitHUB Desktop](https://github.com/shiftkey/desktop) $ yay -S github-desktop (Еще нужно установит gnome-keyring) Или можно скачать Appimage.
- [Code Formatter](https://github.com/prettier/prettier "Prettier — самоуверенный форматировщик кода. Он обеспечивает согласованный стиль, анализируя ваш код и перепечатывая его с помощью собственных правил, учитывающих максимальную длину строки, при необходимости перенося код.")
- [VisualStudio Code](<https://wiki.archlinux.org/title/Visual_Studio_Code_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)>)
  - My VS Code PLUGINS List:
    - [CHEAT.SH Snippet for VS Code](https://github.com/mre/vscode-snippet "Расширение Visual Studio Code для cheat.sh. Быстро и легко находите фрагменты кода для любого языка прямо в вашей IDE.")
    - All Autocomplete
    - Auto Close Tag
    - Auto Complete Tag
    - Auto Rename Tag
    - GitHub Theme
    - Indent one space
    - Indenticator
    - JavaScript (ES6) code snippets
    - jshint (есть настрока для этого плагина. смотреть видео с описанием: https://www.youtube.com/watch?v=rRiTxn15Q3Y&list=PLQEds1ESt7csjTThaq8xzdf0Axxhyk5mL)
    - Live Server
    - Multiple cursor case preserver
    - Open Browser Preview
    - Prettier - Code formatter
    - Python Indent
    - React - Javascript snippets
    - Russian Language Pack for Visual Studio Code
    - Sass
    - Simple icons

```bash
# Как отключить встроенный git в VS Code?

# 1) В левой панели раздел "Расширения" -> "Отображать встроенные расширения"
# 2) Находим расширение Git и все ненужные, нажимаем "Отключить"
```

```config
# json.json
{
  "workbench.startupEditor": "none",
  "workbench.colorTheme": "GitHub Dark Default",
  "files.autoSave": "afterDelay",
  "editor.formatOnSave": true,
  "notebook.compactView": false,
  "editor.fontSize": 18,
  "editor.scrollbar.verticalScrollbarSize": 16,
  "editor.multiCursorModifier": "ctrlCmd",
  "editor.guides.bracketPairs": "active",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "workbench.iconTheme": "minimalistic-icons",
  "editor.quickSuggestions": {"other": true, "comments": true, "strings": true}
}
```

```bash
# Что делать, если каталоги открываются в VSCode?

# Существует файл /usr/share/applications/mimeinfo.cache.
# В нем хранятся ассоциации между mime-типами и приложениями.
# Его редактирование исправляет проблему,
# НО такое решение является временным, так как этот файл генерируется
# при каждом обновлении системы из *.desktop файлов.
№ Удалить в этом фале нуно схожие этим строчкам:
# code-oss.desktop;
# application/x-code-oss-workspace=code-oss.desktop;
# x-scheme-handler/code-oss=code-oss-url-handler.desktop;

# Еще нужно отредактировать MimeType (я его просто закомментировал)
# в /usr/share/applications/visual-studio-code.desktop и обновить mimeinfo.cache:

$ sudo nano /usr/share/applications/visual-studio-code.desktop

# MimeType=text/plain;inode/directory;

$ sudo update-desktop-database /usr/share/applications
```

- [Darling - run macOS software on Linux](https://www.darlinghq.org/)
- [ANDBOX - ANDROID В КОРОБКЕ](https://anbox.io/#collapse2)
- [SQLite Studio](https://github.com/pawelsalawa/sqlitestudio/releases/tag/3.3.3 "Бесплатный многоплатформенный менеджер баз данных SQLite с открытым исходным кодом.")
- [DbGate - (no)SQL database client](https://dbgate.org "SQL-клиент базы данных")
- [CyberPanel](https://cyberpanel.net/docs/installing-cyberpanel/ "Панель управления веб-хостингом") [Тёмная тема](https://community.cyberpanel.net/t/cyberpanel-darkside-theme-also-called-dark-mode-night-mode-dark-theme/30951)

# GAMES

- [Five or More](https://wiki.gnome.org/Apps/Five%20or%20more) — игра Lines. ШАРИКИ
- quadrapassel - аналог классической советской игры «Тетрис».
- gweled - Складывание камней
- megamario - Mega Mario
- foobillard - трехмерный бильярд под Linux.
- dreamchess — трехмерные шахматы для Linux.

# Список приложений GNOME

- GCalctool — калькулятор
- Gconf-editor — редактор конфигураций
- Gedit — текстовый редактор
- Таблица символов GNOME — таблица символов Юникода
- Seahorse — менеджер GPG-ключей
- Tsclient — удаленное администрирование
- EasyTAG — редактор тегов ID3.
- Dia — создание диаграмм
- GnuCash — финансовый менеджер
- GNOME-DB — менеджер баз данных
- Conglomerate — Редактор XML
- GSQL — среда разработки баз данных
- Guake — выпадающий эмулятор терминала

# NEW SOFT NOT TESTED

- [Geppetto](https://geppetto.js.org/ "Набор инструментов анимации WebGL для создания красивой анимации, которая также позволяет управлять в реальном времени.")
- [FreeFileSync](https://pingvinus.ru/program/freefilesync "Программа сравнивает содержимое двух директорий, определяет какие файлы были изменены и выполняет синхронизацию только измененных файлов, сводя к минимуму копирование данных. Может использоваться для создания резервных копий данных.")
