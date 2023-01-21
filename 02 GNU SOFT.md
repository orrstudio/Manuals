![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkYSqYceQoNlj6uuVpp1CluK3knHqwzR2DOw&usqp=CAU)

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
 - [Официальные список приложений GNOME](#%D0%BE%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5-%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9-gnome)
   - [GNOME Administration Suite](#gnome-administration-suite-%D1%81%D0%BE%D1%81%D1%82%D0%BE%D0%B8%D1%82-%D0%B8%D0%B7)
   - [Графика](#%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D0%BA%D0%B0)
   - [Другие](#%D0%B4%D1%80%D1%83%D0%B3%D0%B8%D0%B5)
   - [Интернет](#%D0%B8%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82)
   - [Мультимедиа](#%D0%BC%D1%83%D0%BB%D1%8C%D1%82%D0%B8%D0%BC%D0%B5%D0%B4%D0%B8%D0%B0)
   - [Диски](#%D0%B4%D0%B8%D1%81%D0%BA%D0%B8)
   - [Музыкальные проигрыватели](#%D0%BC%D1%83%D0%B7%D1%8B%D0%BA%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5-%D0%BF%D1%80%D0%BE%D0%B8%D0%B3%D1%80%D1%8B%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D0%B8)
   - [Видео](#%D0%B2%D0%B8%D0%B4%D0%B5%D0%BE)
   - [Офис](#%D0%BE%D1%84%D0%B8%D1%81)
   - [Программирование](#%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)
   - [Системные утилиты](#%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%BD%D1%8B%D0%B5-%D1%83%D1%82%D0%B8%D0%BB%D0%B8%D1%82%D1%8B)
 - [NEW SOFT NOT TESTED](#new-soft-not-tested)

# SYSTEM APPS
## BOOT
 - Ventoy
 - Чтобы отображать лог загрузки Линукса, нужно раскоментировать в файле `/etc/systemd/system.conf` строку с надписью `ShowStatus=yes`
 - [ЗАГРУЗОЧНЫ ДИСК SUPER GRUB2 2.04S1](https://www.supergrubdisk.org/category/download/supergrub2diskdownload/super-grub2-disk-stable/ "Это iso загрузочного диска для испорченных загрузок установленных систем линукс")
 - [Boost Changer](https://github.com/nbebaw/boostchanger "Управляет турбонаддувом процессора и настройками скорости процессора")

## NETWORK
 - telnet (pacman -S inetutils)
 - nman (программа для определения открытых портов сервера)
 - networkmanager-openvpn https://www.youtube.com/watch?v=2oCpjla-lw0
 - samba smbclient cifs-utils gvfs-smb — Сеть для Linux
 - FileZilla (FTP)
 - [TOR PROXY](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=10) - Ставим [GNOME Proxy Switcher](https://extensions.gnome.org/extension/771/proxy-switcher/) Если нету [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep) то ставим его чтобы включать дополнения прямо из браузера. Потом ставим [TOR](https://wiki.archlinux.org/title/tor) в терминале. Включаем тор в терминале под рутом и настраиваем GNOME Proxy Switcer как показано в видео. Ползуемсю.
 - [sshuttle](https://github.com/sshuttle/sshuttle "Прокси-сервер, который работает как VPN форвард по ssh. Не требует админ. Работает с Linux и MacOS. Поддерживает туннелирование DNS.") - (Ставим sshuttle на клиенте и запускаем в терминале: sshuttle -vvvv -r ubuntu@168.188.188.188 -x 168.188.188.188 0/0)

## SYSTEM TOOLS
 - dconf-editor \ # все настройки gnome в одном месте
 - hardinfo (Информация о системе и устройствах)
 - timeshift
 - Stacer — утилита для мониторинга, оптимизации, настройки и очистки системы.
 - Шрифты
 - [Flameshot](https://github.com/flameshot-org/flameshot "Мощное, но простое в использовании программное обеспечение для создания скриншотов")
 - [PAMAC](https://gitlab.manjaro.org/applications/pamac "Графический менеджер пакетов для Arch Linux с поддержкой Alpm, AUR, Appstream, Flatpak и Snap")
 - [YAY](https://github.com/Jguer/yay "Помощник установки пакета из AUR") Чтобы включить цвет в YAY, нужно включить его в `/etc/pacman.conf` удалив `#` с пункта `Color`. Можно также увеличить количество скачивани в пункте `ParallelDownloads = 5` так же удалив `#`
 - [CPM](https://github.com/willeccles/cpm "Обертка для менеджеров пакетов, для всех диструбутивов одинаковые команды.") Скачиваем zip файл распаковываем ставим галочку исполняемый (`chmod g+x cpm` `chmod u+x cpm`) и копируем в /usr/bin: `sudo cp cpm /usr/bin/`
 - [WINE](https://github.com/ferion11/Wine_Appimage "Appimage for Wine 32bits from PlayOnLinux - You can run on no-multilib system") - https://forum.puppylinux.com/viewtopic.php?t=1754
 - [DOSBox](https://www.dosbox.com/)
 - [NTFS-3G](https://wiki.archlinux.org/title/NTFS-3G_%28%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%29 "Поддержка NTFS томов")
 - [Oracle VM VirtualBox](https://www.virtualbox.org/ "Мощный продукт виртуализации x86 и AMD64/Intel64 для корпоративного и домашнего использования.")
 - [Brasero](https://pingvinus.ru/program/brasero "Brasero — программа для записи дисков в Linux. Обладает всеми необходимыми функциями для записи и копирования дисков. Программа Brasero может записывать обычные CD/DVD диски с данными, звуковые диски, видеопроекты, образы дисков (iso и cue), копировать и форматировать диски.")
 - [Actiona](https://github.com/Jmgr/actiona "Макросы для Linux. Actiona - это инструмент автоматизации, который позволяет вам выполнять множество действий на вашем компьютере, таких как эмуляция щелчков мыши, нажатия клавиш, отображения окон сообщений, редактирования текстовых файлов и т. Д. Задачи можно создавать с помощью простого редактора или с помощью программирования EcmaScript (JavaScript). язык для дополнительной настройки. Actiona является кроссплатформенной.")
 - [Ezanvakti](https://github.com/fbostanci/ezanvakti "GNU/Linux icin ezan vakti bildirici")
 - [PowerMate](https://github.com/stefansundin/powermate-linux)
 - [AppImageLauncher](joplin://x-callback-url/openNote?id=fabc4251115544d39e580e698cc2cae9)
 - [PowerMate](https://github.com/stefansundin/powermate-linux "Linux userspace driver for the Griffin PowerMate. (For the classic USB model. There is a proof-of-concept for the Bluetooth model.)")

## COMMANDERS
 - MC - файловый менеджер для Linux.
 - GNOME Commander — двухпанельный файловый менеджер для Linux.
 - File Roller — Archive Manager
 - lf — терминальны файловый менеджер для Linux.
 - ranger — терминальны файловый менеджер для Linux.

## TERMINAL
 - [SSHUTTLE]() - VPN через SSH (Для подключения сначало ставим саму прогу `sshuttle`, а потом вводим в терминале: `sshuttle -vvvv -r ubuntu@168.188.188.88 -x 168.188.188.88 0/0)` для подключения. [VIDEO TUTORIAL](https://www.youtube.com/watch?v=7XDOuH-MPvw)
 - NANO (Консольный Текстовый Редактор)
 - [AstroVIM](https://www.youtube.com/watch?v=LKnuIazeiM4 "Это полноценная ИДЕ на основе NeoVIM со всеми нужными плагинами")
 - TMUX
 - foot - terminal
 - TILIX
 - lsix - photo in terminal
 - Recoll — утилита для поиска файлов по содержимому.
 - bash-completion
 - xclip - буфер обмена для командной строки
 - git или wget (Консольный Менеджер Закачки)
 - [uGet Download Manager](https://ugetdm.com/ "Консольный и Графический Менеджер Закачки и Торрента")
 - [uGet Integrator](https://github.com/ugetdm/uget-integrator "Интегрируйте uGet Download Manager с Google Chrome, Chromium, Opera, Vivaldi и Mozilla Firefox")
 - ZSH & Oh My ZSH. Сначало ставим ZSH а потом Oh My ZSH потом fonts-powerline. После вводим в терминале `sudo usermod -s /bin/zsh orr` и тем самым делаем по умолчанию. Ставим плагины (yay -S zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search)[Как здесь](https://medium.com/macoclock/enhance-your-terminal-with-manjaros-zsh-config-ecada5b2897d) [Powerlevel10k ставим как здесь](https://gist.github.com/kevin-smets/8568070) [Еще инструкции здесь](https://habr.com/ru/post/323496/)
 - [neofetch](https://github.com/dylanaraps/neofetch "Neofetch отображает информацию о вашей операционной системе в терминале, программном и аппаратном обеспечении в эстетичном и визуально приятном виде. Для того чтобы неофетч запускался при открытии терминала нужно в конце файла ~/.bashrc или ~/.zshrc прописать neofetch. Дальше в конфиге неофетча можно скрыть или показать поля для отображения в терминале. Файл конфигурации содается при первом старте неофетч и находится в : ~/.config/neofetch/config.conf")
 - [SSHMenu Utility](https://github.com/Orr888/SSHMenu "Сценарий Bash для управления вашими ssh-соединениями, который создает меню (через диалог в терминале) из вашего файла ~/.ssh/config.")

## INTERNET
 - Google Chrome
 - FireFOX
 - OPERA
 - MEGA
 - insync
 - pCloud
 - [WhatsTron](https://vjba.github.io/whatstron "это настольный клиент WhatsApp для Linux, созданный с помощью Electron.") - WhatsApp для Linux
 - [Telegram Desktop](https://desktop.telegram.org)
 - [XAMPP Apache + MariaDB + PHP + Perl](https://www.apachefriends.org/ru/index.html "OpenServer для Linux")
 - [Proxy Switcher в GNOME и сеть Tor](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=8)

## SECURITY
 - [hBlock](https://github.com/hectorm/hblock "Блокировщик рекламы и вредоносных доменов. Делает записи в /etc/hosts файле.") После установки hBlock следует запустить в терминале: ($ sudo hblock) Для временного отключения hBlock введите в терминале: ($ sudo hblock -S none -D none)
 - [GUFW](http://gufw.org/ "FireWall для Linux") После установки включаем в автозапуск `systemctl enable ufw`
 - seahorse \ # Приложение для управления паролями, а так же PGP и SSH ключами

## SETTINGS Aplications for GNOME
 - gnome-control-center — Центр управления для GNOME
 - gnome-tweaks — Дополнительные настройки GNOME
 - Adwaita Dark — Темная тема для GNOME (предоставляется пакетом gnome-themes-extra)
 - chrome-gnome-shell — Надстрока для GNOME Extensions (Позволяет устанавливать Gnome "extensions" через Хром браузер)
 - fragments - torrent client for GNOME
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
 - [Weather in The Clock](https://github.com/JasonLG1979/gnome-shell-extension-weather-in-the-clock/ "Отображение текущей погоды в часах.")
 - [Системный монитор GNOME](https://github.com/mgalgs/gnome-shell-system-monitor-applet "Отображение информации в строке состояния GNOME (память, процессор, скорость интернета и т.д.")
 - [GPaste](https://www.imagination-land.org/tags/GPaste.html "Система управления буфером обмена для GNOME 40 - (Clipboard management system)")
 - [Net Speed Simpl](https://github.com/prateekmedia/netspeedsimplified "Это на тот случай если хочется видеть только скорость интернета  строке состояния рядом с часами.")
 - KDE Connect

# OFFICE SOFTS

 - Libre Office
 - [CherryTree для Kelime Kelime Kuran Meali](https://www.giuspen.com/cherrytree/ "Приложение для создания иерархических заметок с богатым текстом и подсветкой синтаксиса, хранящее данные в одном файле xml или sqlite.")
 - [Gromit-MPX](https://github.com/bk138/gromit-mpx "Это инструмент для экранных аннотаций, который работает с любой средой рабочего стола Unix под X11, а также с Wayland. Его основное использование для создания презентаций некоторых приложений. Обычно вам нужно будет перемещать указатель мыши вокруг точки интереса, пока все не заметят ее. С Gromit-MPX вы можете рисовать везде на экране, выделяя какую-то кнопку или область. Для установки используем yay -S gromit-mpx")

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
 - [Kid3](https://kid3.kde.org "Редактoр тегoв audio файлoв")
 - Audacious — WINAMP
 - OBS Studio - Программа для записи экрана.
 - Hypnotix - Ip TV


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


# DEVELOPE
 - [GitHUB Desktop](https://github.com/shiftkey/desktop) $ yay -S github-desktop (Еще нужно установит gnome-keyring) Или можно скачать Appimage.
 - [VisualStudio Code](https://wiki.archlinux.org/title/Visual_Studio_Code_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9))
    - VS Code PLUGINS List:
        - [Snippet](https://github.com/mre/vscode-snippet "Расширение Visual Studio Code для cheat.sh. Быстро и легко находите фрагменты кода для любого языка прямо в вашей IDE.")
        - Bracket Pair Colorizer
        - GitLens — Git supercharged
        - HTML CSS Support
        - indent-rainbow
        - Kite AutoComplete AI Code: Python, Java, Go, PHP, C/C#/C++, Javascript, HTML/CSS, Typescript, React, Ruby, Scala, Kotlin, Bash, Vue, React
        - Open Browser Preview
        - PHP Intelephense
        - Prettier - Code formatter
        - Russian Language Pack for Visual Studio Code
        - Sandbox
        - vscode-icons
        - Better Comments
```config
 settings.json
	{
    "workbench.colorTheme": "Monokai Dimmed",
    "editor.formatOnSave": true,
    "git.autofetch": "all",
    "files.autoSave": "afterDelay",
    "kite.enableSnippets": false,
    "github.gitAuthentication": false,
    "explorer.confirmDelete": false,
    "notebook.compactView": false,
    "notebook.markup.fontSize": 0,
    "editor.codeLensFontSize": 0,
    "editor.scrollbar.verticalScrollbarSize": 16,
    "editor.fontSize": 18,
    "git.enableSmartCommit": true,
    "kite.showWelcomeNotificationOnStartup": false,
    "editor.multiCursorModifier": "ctrlCmd",
    "workbench.startupEditor": "none",
    "workbench.iconTheme": "vscode-icons",
    "kite.startKiteEngineOnStartup": false,
    "bracketPairColorizer.depreciation-notice": false,
    "editor.bracketPairColorization.enabled": true,
    "editor.guides.bracketPairs":"active".
		"folders": [{"path": "../../../../GitHub"}],
		"settings": {}
	}
```
```bash
# Что делать, если каталоги открываются в VSCode?
# Существует файл /usr/share/applications/mimeinfo.cache. В нем хранятся ассоциации между mime-типами и приложениями. Его редактирование исправляет проблему, НО такое решение является временным, так как этот файл генерируется при каждом обновлении системы из *.desktop файлов.

# Нужно отредактировать MimeType (я его просто закомментировал) в /usr/share/applications/visual-studio-code.desktop и обновить mimeinfo.cache:
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


# [Официальные список приложений GNOME](https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9_GNOME)
 - Aisleriot — коллекция пасьянсов.  
 - Alacarte — редактор меню  
 - Attaxx — игра  
 - Baobab — анализ использования жёстких дисков  
 - Cheese — программа для работы с веб-камерой в стиле фотобудки 
 - Dasher — средство предикативного ввода текста  
 - DeskbarApplet  
 - Ekiga — телефония, видео конференции и VoIP  
 - Epiphany — браузер  
 - Evince — просмотр документов  
 - Evolution — почтовый клиент, органайзер  
 - Eye of GNOME — просмотр изображений  
 - File Roller — архиватор  
 - GCalctool — калькулятор  
 - GDM — менеджер дисплея для GNOME  
 - GNOME Games — набор игр  
 - GNOME Keyring — менеджер паролей  
 - Gconf-editor — редактор конфигураций  
 - Gedit — текстовый редактор  
 - Gnet — a networking API built atop GTK's GLib library  
 - Gnome Print Manager — менеджер печати  
 - Gnome Terminal — эмулятор терминала  
 - Gnome-cd — Проигрывание Аудио-CD  
 - Gnome-control-center — центр управления  
 - Gnome-dictionary — словарь  
 - Gnome-mag — Desktop magnifier  
 - Gnome-nettool — диагностика сети  
 - Gnome-panel — панель GNOME  
 - Gnome-screensaver — хранитель и блокировщик экрана  
 - Gnome-screenshot — программа для создания скриншотов  
 - Gnome-search-tool — инструменты поиска  
 - Gnome-system-monitor — системный монитор  
 - Gnome-system-tools — средства администрирования системы  
 - Gnome-utils — различные утилиты  
 - Gnome-volume-manager  
 - Gok — экранная клавиатура  
 - Grecord — запись звука  
 - Таблица символов GNOME — таблица символов Юникода  
 - Logview — просмотр системных журналов  
 - Nautilus — файловый менеджер  
 - Seahorse — менеджер GPG-ключей  
 - Sound Juicer — CD риппинг  
 - Tomboy — редактор заметок  
 - Totem — медиапроигрыватель  
 - Tsclient — удаленное администрирование  
 - Vino — VNC — сервер  
 - Yelp — просмотр справки  
 - Zenity — Show GUI dialogs from scripts  
 - GNOME Developer Suite состоит из:
 - Anjuta — IDE[2]
 - Devhelp — просмотр документации
 - Glade — быстрое редактирование графических интерфейсов

## GNOME Administration Suite состоит из:
- Pessulus — редактор блокировок возможностей пользовательского интерфейса
- Sabayon — редактор профилей пользователей

Далее представлены приложения, которые разработаны с использованием библиотек GNOME.

### Графика
 - F-Spot — менеджер фотографий
 - gThumb — просмотр изображений
 - GIMP — графический редактор
 - Inkscape — векторный графический редактор

### Другие
 - Beagle — локальный поисковик
 - Bluefish — текстовый редактор программиста
 - GCstar — менеджер коллекций
 - Meld — сравнение текстовых файлов и содержимого каталогов.
 - Scribes — текстовый редактор
 - Tracker — локальный поисковик
 - LAVClock — часы в панель задач (только для Windows)

### Интернет
 - Balsa — почтовый клиент
 - Banter — real time collaboration client focused on the big three: text, voice and video
 - Deluge — клиент BitTorrent
 - Drivel — клиентблогов.
 - Empathy — мультипротокольный клиент мгновенных сообщений.
 - Gabber — мгновенные сообщения
 - Gajim — мгновенные сообщения
 - gFTP — клиент FTP
 - Gossip — клиент Jabber
 - Gwibber — клиент микроблогов
 - Pan — клиент Usenet
 - Pidgin — мгновенные сообщения
 - Liferea — аггрегатор RSS
 - Gwget — менеджер закачек
 - XChat — клиент IRC

### Мультимедиа
 - EasyTAG — редактор тегов ID3.

### Диски
 - Brasero — запись CD и DVD
 - Coaster — приложение для записи CD
 - GnomeBaker — запись CD и DVD
 - Graveman — запись CD
 - Grip — CD риппинг
 - Serpentine — запись Audio CD

### Музыкальные проигрыватели
 - Banshee
 - Gnomoradio
 - Listen
 - Muine
 - Rhythmbox
 - Exaile

### Видео
 - CeeMedia — каталог видео
 - Diva — редактор видео
 - K3B — запись CD и DVD

### Офис
 - AbiWord — текстовый процессор
 - Dia — создание диаграмм
 - GnuCash — финансовый менеджер
 - Gnumeric — редактор таблиц
 - GNOME-DB — менеджер баз данных
 - LibreOffice — редактор таблиц, текстовый процессор, редактор презентаций

### Программирование
 - Conglomerate — Редактор XML
 - GSQL — среда разработки баз данных
 - Mono — среда разработки
 - OpenLDev — среда разработки
 - Scaffold — среда разработки

### Системные утилиты
 - GNOME Commander — двухпанельный файловый менеджер
 - GParted — разбиение дисков
 - Guake — выпадающий эмулятор терминала


# NEW SOFT NOT TESTED
 - [Моя папка в сети](https://www.youtube.com/watch?v=lCfIgtLVNfM) 
 - [Geppetto](https://geppetto.js.org/ "Набор инструментов анимации WebGL для создания красивой анимации, которая также позволяет управлять в реальном времени.") 
 - [ScreenCat](https://www.electronjs.org/apps/screencat "Совместное использование экрана WebRTC")
 - [FreeFileSync](https://pingvinus.ru/program/freefilesync "Программа сравнивает содержимое двух директорий, определяет какие файлы были изменены и выполняет синхронизацию только измененных файлов, сводя к минимуму копирование данных. Может использоваться для создания резервных копий данных.")

