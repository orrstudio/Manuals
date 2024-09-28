<img src="https://user-images.githubusercontent.com/65281943/215001207-d1a0f318-2a85-468a-b391-fd55e569dc9f.png" height="300" align="middle">

[List of Arch Linux applications](https://wiki.archlinux.org/title/List_of_applications#top-page "Эта статья представляет собой общий список приложений, отсортированных по категориям, в качестве справки для тех, кто ищет пакеты. Многие разделы разделены между консольными и графическими приложениями.")

# ОГЛАВЛЕНИЕ

- [SYSTEM APPS](#system-apps)
  - [BOOT](#boot)
  - [NETWORK](#network)
  - [SYSTEM TOOLS](#system-tools)
  - [REMOTE DESKTOP APPS](#remote-desktop-apps)
  - [COMMANDERS](#commanders)
  - [TERMINAL](#terminal)
  - [INTERNET](#internet)
  - [SECURITY](#security)
  - [SETTINGS Aplications for GNOME](#settings-aplications-for-gnome)
  - [EXTENSIONS for GNOME](#extensions-for-gnome)
- [OFFICE](#office-softs)
- [E-BOOKS](#e-books)
- [AUDIO & VIDEO](#audio--video)
- [PHOTO](#photo)
- [DEVELOPE](#develope)
- [GAMES](#games)
- [Список приложений GNOME](#%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9-gnome)

# SYSTEM APPS

## Boot

> Чтобы отображать лог загрузки Линукса, нужно раскоментировать в файле `/etc/systemd/system.conf` строку с надписью `ShowStatus=yes`

- [Ventoy](https://github.com/ventoy/Ventoy "A new bootable USB solution.")
- [ЗАГРУЗОЧНЫ ДИСК SUPER GRUB2 2.04S1](https://www.supergrubdisk.org/category/download/supergrub2diskdownload/super-grub2-disk-stable/ "Это iso загрузочного диска для испорченных загрузок установленных систем линукс")
- [Boost Changer](https://github.com/nbebaw/boostchanger "Управляет турбонаддувом процессора и настройками скорости процессора")

## Network

- [What IP](https://flathub.org/ru/apps/org.gabmus.whatip "Информация о вашем IP")
- telnet (pacman -S inetutils)
- nman - программа для определения открытых портов сервера
- networkmanager-openvpn - [tutorial](https://www.youtube.com/watch?v=2oCpjla-lw0)
- samba, smbclient, cifs-utils, gvfs-smb — [MANUAL для настройки сети SAMBA](https://github.com/orrstudio/My-Notes-and-Manuals/blob/main/03%20HELP%20%26%20MAN/11%20SAMBA%20(%D0%9D%D0%90%D0%A1%D0%A2%D0%A0%D0%9E%D0%99%D0%9A%D0%98).md)
- FileZilla (FTP)
- [FreeFileSync](https://freefilesync.org "Программа сравнивает содержимое двух директорий, определяет какие файлы были изменены и выполняет синхронизацию только измененных файлов, сводя к минимуму копирование данных. Может использоваться для создания резервных копий данных. Работает с FTP и SFTP")
- TOR PROXY - Включаем [TOR](https://wiki.archlinux.org/title/tor) в терминале под рутом и настраиваем [GNOME Proxy Switcher](https://extensions.gnome.org/extension/771/proxy-switcher/) как показано в [видео](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=10).
- [IP Lookup](https://flathub.org/ru/apps/io.github.bytezz.IPLookup) - Найти информацию об IP-адресе интернет-провайдерa, географическое положение IP-адреса и т.д.

## System Tools

- qt5ct, qt6ct, kvantum (Для настройки темного режима Qt приложений)
- [Distrobox](https://github.com/89luca89/distrobox) - Используйте любой дистрибутив Linux внутри своего терминала
- [Flatseal](https://flathub.org/ru/apps/com.github.tchx84.Flatseal "Это графическая утилита для просмотра и изменения разрешений ваших приложений Flatpak.") - Утилита управления разрешениями Flatpak
- [Warehouse](https://flathub.org/ru/apps/io.github.flattool.Warehouse "управляет установленными пакетами Flatpak, их пользовательскими данными и репозиториями.") - Утилита управления установленными пакетами Flatpak
- [Gear Lever](https://flathub.org/ru/apps/it.mijorus.gearlever "Утилита управления AppImages! Gear Lever создаёт ярлыки приложений, обновляет и хранить несколько версий одновременно") - Утилита управления AppImages
- [Iconic](https://flathub.org/ru/apps/nl.emphisia.icon) - добавить значок папке
- [PulseAudio Volume Control](https://flathub.org/ru/apps/org.pulseaudio.pavucontrol "Это инструмент управления громкостью («микшер») для звукового сервера PulseAudio. Позволяет управлять громкостью каждого потока воспроизведения в отдельности.") - pavucontrol это микшер звука PulseAudio сервера
- [Easy Effects](https://github.com/wwmm/easyeffects?tab=readme-ov-file) - инструмент для манипуляций со звуком
- [File manager functionality](https://wiki.archlinux.org/title/File_manager_functionality_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9) "Монтирование цифровых фотоаппаратов и мобильных устройств и многое другое")
- dconf-editor - все настройки gnome в одном месте
- hardinfo - Информация о системе и устройствах
- File Roller — Archive Manager
- timeshift
- Stacer — Утилита для мониторинга, оптимизации, настройки и очистки системы.
- [Шрифты](https://github.com/orrstudio/Manuals/blob/9853127bda563d6edb6e1d8fb4c503d628a08eee/03%20HELP%20%26%20MAN/07%20%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20%D0%A8%D1%80%D0%B8%D1%84%D1%82%D0%BE%D0%B2.md)
- [gerb](https://github.com/epilys/gerb) - font editor
- [PAMAC](https://gitlab.manjaro.org/applications/pamac) - Графический менеджер пакетов для Arch Linux с поддержкой Alpm, AUR, Appstream, Flatpak и Snap
- [YAY](https://github.com/orrstudio/Manuals/blob/9853127bda563d6edb6e1d8fb4c503d628a08eee/03%20HELP%20%26%20MAN/01%20Yay%20%E2%80%93%20%D0%95%D1%89%D0%B5%20%D0%BE%D0%B4%D0%B8%D0%BD%20%D0%BD%D0%B0%D0%B4%D0%B5%D0%B6%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D0%BC%D0%BE%D1%89%D0%BD%D0%B8%D0%BA%20AUR%2C%20%D0%BD%D0%B0%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BD%D0%B0%20GO%20%E2%80%93%20IT%20is%20good.md) - менеджер пакетов для Arch Linux
- [DOSBox](https://www.dosbox.com/)
- [NTFS-3G](https://wiki.archlinux.org/title/NTFS-3G_%28%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%29 "Поддержка NTFS томов")
- QEMU
  > 
  > yay -Sy libvirt virt-manager qemu extra/qemu-arch-extra extra/qemu-guest-agent dnsmasq edk2-ovmf iptables ebtables dmidecode
  > [Install tutorial -1](https://www.youtube.com/watch?v=Izxng1e67KE&list=PL6gG7zVB_EJxCYuQAKMwWXZqxED7FAesN&index=4)
  > [Install tutorial -2](https://www.youtube.com/watch?v=h4M36yHjnLM&list=PLjW32vCGNUuY7fcnkEjeHZPtr3Gibswb9&index=14)
- [Oracle VM VirtualBox](https://www.virtualbox.org/ "Мощный продукт виртуализации x86 и AMD64/Intel64 для корпоративного и домашнего использования.")
- [Brasero](https://pingvinus.ru/program/brasero "Brasero — программа для записи дисков в Linux. Обладает всеми необходимыми функциями для записи и копирования дисков. Программа Brasero может записывать обычные CD/DVD диски с данными, звуковые диски, видеопроекты, образы дисков (iso и cue), копировать и форматировать диски.")
- [Actiona](https://github.com/Jmgr/actiona "Макросы для Linux. Actiona - это инструмент автоматизации, который позволяет вам выполнять множество действий на вашем компьютере, таких как эмуляция щелчков мыши, нажатия клавиш, отображения окон сообщений, редактирования текстовых файлов и т. Д. Задачи можно создавать с помощью простого редактора или с помощью программирования EcmaScript (JavaScript). язык для дополнительной настройки. Actiona является кроссплатформенной.")
- [PDF4QT](https://flathub.org/ru/apps/io.github.JakubMelka.Pdf4qt "для просмотра/редактирования PDF-файлов")
- [Adobe Reader](https://flathub.org/ru/apps/com.adobe.Reader "официальное программное обеспечение Adobe для просмотра, печати и аннотирования PDF-документов.")
- [PowerMate](https://github.com/stefansundin/powermate-linux "Linux userspace driver for the Griffin PowerMate. (For the classic USB model. There is a proof-of-concept for the Bluetooth model.)")
- [CPU-X](https://flathub.org/ru/apps/io.github.thetumultuousunicornofdarkness.cpu-x "Собирает информацию о процессоре, материнской плате и многом другом.")
- [Shortcut](https://flathub.org/ru/apps/io.github.andreibachim.shortcut "Сделайте ярлыки приложений")
- [PeaZip](https://peazip.github.io/peazip-linux.html "МЕНЕДЖЕР АРХИВОВ ДЛЯ LINUX")

## Remote DESKTOP Apps

- [RustDesk](https://github.com/rustdesk/rustdesk "Приложение для удаленного рабочего стола с открытым исходным кодом на всех устройствах, предназначенное для самостоятельного размещения в качестве альтернативы TeamViewer.")
- [AnyDesk](https://anydesk.com "Решение для удаленного доступа")
- [Tiny RDM](https://github.com/tiny-craft/tiny-rdm "Tiny RDM (Tiny Redis Desktop Manager) — современный, красочный и сверхлегкий клиент Redis с графическим интерфейсом для Mac, Windows и Linux.")

## Terminal

- bash-completion
- tree - Дерево файлов и каталогов в терминале
- git - Консольный Менеджер Закачки
- wget - Консольный Менеджер Закачки
- tilix - Много-окнонный терминал
- ranger — терминальны файловый менеджер для Linux.
- nano - Консольный Текстовый Редактор
- mc - файловый менеджер для Linux.
- [systemctl-tui](https://github.com/rgwood/systemctl-tui "Быстрый и простой TUI для взаимодействия со службами systemd и их журналами.") - взаимодействия со службами systemd и их журналами
- [INTELLI-SHELL](https://github.com/lasantosr/intelli-shell) - хранилище закладок для команд в терминале
- [Translate Shell](https://www.soimort.org/translate-shell) - Переводчик командной строки
- [sshuttle](https://github.com/sshuttle/sshuttle) - VPN через SSH или Прокси-сервер, который работает как VPN форвард по ssh. Не требует админ. Поддерживает туннелирование DNS.
  > Ставим `sshuttle` на клиенте и запускаем там же в терминале: `sshuttle -vvvv -r ubuntu@168.188.188.188 -x 168.188.188.188 0/0` для подключения.
  > [VIDEO TUTORIAL](https://www.youtube.com/watch?v=7XDOuH-MPvw)
- [SSHMenu Utility](https://github.com/Orr888/SSHMenu "Сценарий Bash для управления вашими ssh-соединениями, который создает меню (через диалог в терминале) из вашего файла ~/.ssh/config.")
- ZSH & Oh My ZSH
  > Сначало ставим `ZSH` а потом `Oh My ZSH` потом `fonts-powerline`.
  > После вводим в терминале `sudo usermod -s /bin/zsh orr` и тем самым делаем по умолчанию.
  > [Ставим плагины как здесь](https://medium.com/macoclock/enhance-your-terminal-with-manjaros-zsh-config-ecada5b2897d) - (yay -S zsh-autosuggestions, zsh-syntax-highlighting, zsh-history-substring-search)
  > [Powerlevel10k ставим как здесь](https://gist.github.com/kevin-smets/8568070)
  > [Еще инструкции здесь](https://habr.com/ru/post/323496/)
- [neofetch](https://github.com/dylanaraps/neofetch) - отображает информацию о вашей операционной системе в терминале
  > Для того чтобы неофетч запускался при открытии терминала нужно в конце файла ~/.bashrc или ~/.zshrc прописать neofetch.
  > Дальше в конфиге неофетча можно скрыть или показать поля для отображения в терминале.
  > Файл конфигурации содается при первом старте неофетч и находится в : ~/.config/neofetch/config.conf")
- [AstroVIM](https://www.youtube.com/watch?v=LKnuIazeiM4) - Это полноценная ИДЕ на основе NeoVIM со всеми нужными плагинами
- [Vim color themes](https://vimcolorschemes.com/dark/)
- duf - Показывает информацию про диски в табличной форме (аналог df).
- TMUX
- Recoll — утилита для поиска файлов по содержимому.
- xclip - буфер обмена для командной строки
- [cloudcross](https://cloudcross.mastersoft24.ru) - для синхронизации между вашими устройствами и различными облачными хранилищами. Такими как: GoogleDrive, OndeDrive, Dropbox, ЯндексДиск и Mail.Ru
```bash
ccross -a # Cloud provider athentication
ccross --prefer local # Can be one of "local" or "remote". "remote" - for priority of google-drive, and "locl" for local folder priority.
ccross --dry-run # shows which files will be loaded/unloaded, but really do not synchronize
ccross -p /home/orr/Downloads/google-drive # the absolute path to synchronize directory. And synchronizing command.
ccross # For synchronization, you enough run.
```

## INTERNET

- FireFOX
- Google Chrome
- OPERA
- [CrowTranslate](https://flathub.org/ru/apps/io.crow_translate.CrowTranslate) - Переводчик переводить и озвучивать текст с помощью Google, Yandex, Bing, LibreTranslate и Lingva translate API.
- MEGA
- insync
- pCloud
- [uGet Download Manager](https://ugetdm.com/ "Консольный и Графический Менеджер Закачки и Торрента")
- [uGet Integrator](https://github.com/ugetdm/uget-integrator "Интегрируйте uGet Download Manager с Google Chrome, Chromium, Opera, Vivaldi и Mozilla Firefox")
- [Telegram Desktop](https://desktop.telegram.org)
- [XAMPP Apache + MariaDB + PHP + Perl](https://www.apachefriends.org/ru/index.html "OpenServer для Linux")
- [Proxy Switcher в GNOME и сеть Tor](https://www.youtube.com/watch?v=mM9680l7MyY&list=PLcrZh07ZsO5GO97bZtxqFlSw26UKgz5lB&index=8)
- [Youtube Downloader Plus](https://flathub.org/ru/apps/io.github.aandrew_me.ytdn "Скачивайте видео и аудио с сотен сайтов")

## SECURITY

- [Менеджер Паролей - GPG, Pass, QtPass, Kleopatra](https://github.com/orrstudio/Manuals/blob/9853127bda563d6edb6e1d8fb4c503d628a08eee/03%20HELP%20%26%20MAN/26%20%D0%9C%D0%B5%D0%BD%D0%B5%D0%B4%D0%B6%D0%B5%D1%80%20%D0%9F%D0%B0%D1%80%D0%BE%D0%BB%D0%B5%D0%B9%20-%20GPG%2C%20Pass%2C%20QtPass%2C%20Kleopatra.md)
- [GUFW](http://gufw.org/ "FireWall для Linux") - После установки включаем в автозапуск `systemctl enable ufw`
- [hBlock](https://github.com/hectorm/hblock "Блокировщик рекламы и вредоносных доменов. Делает записи в /etc/hosts файле.") - После установки hBlock следует запустить в терминале: ($ sudo hblock) Для временного отключения hBlock введите в терминале: ($ sudo hblock -S none -D none)
- [firejail](https://github.com/netblue30/firejail "ПЕСОЧНИЦА для линукс") - [доп инфа в видео](https://www.youtube.com/watch?v=OWu5RNWjhEc)

## EXTENSIONS for GNOME

<img src="https://raw.githubusercontent.com/andyholmes/gnome-shell-extensions-badge/master/get-it-on-ego.svg?sanitize=true" alt="Get it on GNOME Extensions" height="100" align="middle">

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

## Aplications for GNOME

- gnome-control-center — Центр управления
- gnome-tweaks — Дополнительные настройки
- Adwaita Dark — Темная тема для GNOME (предоставляется пакетом gnome-themes-extra)
- chrome-gnome-shell — Позволяет устанавливать Gnome "extensions" через Хром браузер
- fragments - torrent client
- transmission - torrent client 
- GtkHash - Hash summ files
- feary - email client
- seahorse - Хранител паролей и создатель ключей SSH, PGP
- Webapp Manager - создает приложение из вэб страницы
- gnome-screenshot
- System Monitor (HTOP)
- fonts
- system log
- gnome-connections — RDP for GNOME
- GCalctool — калькулятор
- Gconf-editor — редактор конфигураций
- Gedit — текстовый редактор
- Таблица символов Юникода
- Tsclient — удаленное администрирование
- EasyTAG — редактор тегов ID3.
- Dia — создание диаграмм
- GNOME-DB — менеджер баз данных
- Conglomerate — Редактор XML
- GSQL — среда разработки баз данных
- Guake — выпадающий эмулятор терминала

# OFFICE

## Office

- [Libre Office](https://ru.libreoffice.org "LibreOffice — мощный офисный пакет, полностью совместимый с 32/64-битными системами. Переведён более чем на 30 языков мира. Поддерживает большинство популярных операционных систем, включая GNU/Linux, Microsoft Windows и Mac OS X.")
- [Apostrophe - Edit Markdown in style](https://flathub.org/ru/apps/org.gnome.gitlab.somas.Apostrophe)

## E-Books

- [Sigil & PageEdit](https://sigil-ebook.com/ "Sigil - Редактор электронных книг EPUB / PageEdit - это редактор WYSIWYG XHTML, предназначенный как приложение Sigil Companion.")
- [Thorium](https://github.com/edrlab/thorium-reader/releases "Кроссплатформенное desktop-ное приложение для чтения электронных книг EPUB")

# AUDIO & VIDEO

## Players

- [SMPlayer](https://flathub.org/ru/apps/info.smplayer.SMPlayer "Audio Video Player")
- [Qmmp](https://flathub.org/ru/apps/com.ylsoftware.qmmp.Qmmp "Audio Player")
- [Audacious](https://flathub.org/ru/apps/org.atheme.audacious "Audio Player")
- [Kid3](https://kid3.kde.org "Редактoр тегoв audio файлoв")

## Montaj

- [SHOTCUT](https://flathub.org/ru/apps/org.shotcut.Shotcut "Видео монтаж")
- [OBS Studio](https://flathub.org/ru/apps/com.obsproject.Studio "Запись Экрана")
- [REAPER](https://www.reaper.fm "Аудио монтаж")
- [ocenaudio](https://www.ocenaudio.com/ "Аудио монтаж")
- [Ardour](https://ardour.org/ "Аудио монтаж")

## Converters

- [HandBrake](https://flathub.org/ru/apps/fr.handbrake.ghb "Конвертер видео")
- [FF Multi Converter](https://sites.google.com/site/ffmulticonverter/home "Конвертер аудио, видео, изображений и документов между всеми популярными форматами")
- [youtube-dl-gui](https://github.com/jely2002/youtube-dl-gui/releases/tag/v2.2.2 "youtube-dl-gui")
- [VoiceGen](https://flathub.org/ru/apps/io.gitlab.persiangolf.voicegen "преобразовывать текст в речь")

# PHOTO

- [gThumb](https://pingvinus.ru/program/gthumb "Программа просмотра изображений для рабочего стола GNOME")
- [digiKam](https://www.digikam.org/download) - Управления цифровыми фотографиями. Импорт, управление, редактирование, обмен фотографиями и необработанными файлами.
- [darktable](https://www.darktable.org/ "Приложение для обработки фотографий")
- [Gimp](https://www.gimp.org/ "Программа для создания и обработки растровой графики и частичной поддержкой работы с векторной графикой")
- [Inkscape](https://inkscape.org/)
- [Krita](https://krita.org/en/)
- [MyPaint](https://github.com/mypaint/mypaint/releases/tag/v2.0.1) - программа для рисования
- [Coulr](https://flathub.org/ru/apps/com.github.huluti.Coulr) - инструмент для получения кода цветов
- [Eyedropper](https://github.com/FineFindus/eyedropper) - инструмент для получения кода цветов для GNOME
- ksnip - Инструмент для создания и аннотирования снимков экрана
- [Gromit-MPX](https://github.com/bk138/gromit-mpx) - Инструмент для экранных аннотаций. Можете рисовать везде на экране, выделяя какую-то кнопку или область. (yay -S gromit-mpx)

# DEVELOPE

- [GitHUB Desktop](https://flathub.org/ru/apps/io.github.shiftey.Desktop)
- [VisualStudio](https://flathub.org/ru/apps/search?q=VisualStudio)
- [SQLite Studio](https://github.com/pawelsalawa/sqlitestudio/releases/tag/3.3.3) - менеджер баз данных SQLite
- [CyberPanel](https://cyberpanel.net/docs/installing-cyberpanel) - Панель управления веб-хостингом
- [Darling](https://www.darlinghq.org/) - run macOS software on Linux
- [ANDBOX](https://anbox.io/#collapse2) - ANDROID В КОРОБКЕ

# GAMES

- [Five or More](https://wiki.gnome.org/Apps/Five%20or%20more) — игра Lines. ШАРИКИ
- quadrapassel - аналог классической советской игры «Тетрис».
- gweled - Складывание камней
- megamario - Mega Mario
- foobillard - трехмерный бильярд под Linux.
- dreamchess — трехмерные шахматы для Linux.
