############################################################
# Отредактируйте этот файл конфигурации, чтобы определить, #
# что должно быть установлено в вашей системе.             #
#==========================================================#

{ config, pkgs, ... }: 
{
  # Подключение файла конфигурации оборудования
  imports = [ ./hardware-configuration.nix ];

  # Загрузчик системы
    boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
    theme = "/boot/grub/themes/atomic"; };

  # Имя хоста (Компа)
    networking.hostName = "nixos"; 

  # Включение сети Ethernet
    networking.networkmanager.enable = true;

  # Включение беспроводной сети WiFi
  # networking.wireless.enable = true;  

  # Включение Bluetooth
  # hardware.bluetooth.enable = true; # включает поддержку Bluetooth
  # hardware.bluetooth.powerOnBoot = true; # включает Bluetooth при загрузке

  # Настройка прокси
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Часовой пояс
    time.timeZone = "Asia/Baku";

  # Региональные настройки
    i18n = {
        defaultLocale = "ru_RU.UTF-8"; # Язык системы по умолчанию
        extraLocaleSettings = { 
          # Дополнительные настройки локали
          LC_ADDRESS = "ru_RU.UTF-8"; # Определяет формат почтовых адресов
          LC_IDENTIFICATION = "ru_RU.UTF-8"; # Определяет метаданные о локали
          LC_MEASUREMENT = "ru_RU.UTF-8"; # Формат денег
          LC_MONETARY = "ru_RU.UTF-8"; # Определяет систему измерения
          LC_NAME = "ru_RU.UTF-8"; # Определяет формат полных имен людей
          LC_NUMERIC = "ru_RU.UTF-8"; # Определяет формат чисел
          LC_PAPER = "ru_RU.UTF-8"; # Определяет размер листа бумаги
          LC_TELEPHONE = "ru_RU.UTF-8"; # Определяет формат телефонных номеров
          LC_TIME = "ru_RU.UTF-8"; # Определяет формат даты и времени
        };
    };
  # Кирилица для терминала 
    console = {
      font = "cyr-sun16";
      keyMap = "ruwin_alt_sh-UTF-8";
    };  

#==================#
# Сервисы и демоны #
#==================#

  # Настройка раскладки клавиатуры в X11
    services.xserver.layout = "us,ru,az";

  # Включение оконной системы X11
    services.xserver.enable = true;

  # Сервис Flatpak
    services.flatpak.enable = true;

  # Демон OpenSSH
  # services.openssh.enable = true;

  # Включение CUPS (для печати документов)
  # services.printing.enable = true;

  # Включение сенсорной панели (включено по умолчанию)
  # services.xserver.libinput.enable = true;

  # Включение среды рабочего стола GNOME
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

  # Включение автоматического входа пользователя
    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "orr";
  # Обходной путь для автоматического входа в GNOME
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;

  # Включение звука (Pipewire)
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    # jack.enable = true;
    # используйте пример менеджера сеансов (другие еще не упакованы, 
    # поэтому он включен по умолчанию, пока нет необходимости 
    # переопределять его в вашей конфигурации)
    # media-session.enable = true;
    };

  # Сервис для просмотра содержимого фото камеры
    services.gvfs.enable = true;

#=============================#
# Учетная запись пользователя #
#=============================#
    users.users.orr = {
    # Пароль установить с помощью ‘passwd’
      isNormalUser = true;
      description = "Oruc Qafarov";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      # Приложения установленные только для текущуго пользователя:
      # firefox
      ];
    };

#===============================================#
# Некоторым программам требуются оболочки SUID, #
# они запускаются в пользовательских сеансах.   #
#===============================================#

  # programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
  #   enableSSHSupport = true;
    };

#=============================#
# Дополнительные фитчи и софт #
#=============================#

# Разрешить несвободный софт
  nixpkgs.config.allowUnfree = true;

# Расширение browserpass
  programs.browserpass.enable = true;

# Конфигурация приложения - "Настройка Qt5"
# "Настройка Qt5" используется для измененияе темы приложений (QtPass)
  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "qt5ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
  };

#======================#
# Переменные окружения #
#======================#

  environment.variables = {
  # Переменная для работы некоторых расширений "GNOME Tweaks"
  GI_TYPELIB_PATH = "/run/current-system/sw/lib/girepository-1.0";
  # Переменная для работы приложения - "Настройка Qt5"
  QT_QPA_PLATFORMTHEME = "qt5ct";
  };

#===========================================================#
# --== Приложения установленные для всех пользователей ==-- #
#            https://search.nixos.org/packages              #
#===========================================================#

  environment.systemPackages = with pkgs; [
  
# -== Системные Приложения ==--
# nano # Установлен в системе по умолчанию.
# vim # Терминальный текстовый редактор
  tilix # Тайлинговый эмулятор терминала
  tree # Консольная утилита просмотра в формате дерева
# htop # Просмотрщик процессов в терминале
# neofetch # Системная информации в терминале
# mc # Файловый менеджер Midnight Commander
# wget # Получения файлов через HTTP, HTTPS и FTP
  git # Клнирование репозтриев на компьютер
# ventoy # Утилита для создания загрузочной флешки
  github-desktop
  pass # The standard unix password manager
  qtpass # GUI for Pass
  libsForQt5.kleopatra # GUI for Pass and GPG
  browserpass # Browsers Extantion for Pass/gpg
# libsForQt5.qtstyleplugin-kvantum # Диспетчер Kvantum Manager
  libsForQt5.qt5ct # Приложение "Настройки Qt5"
  
# --== Приложения для Canon Camera ==--
  gphoto2 # CLI Консольное приложение для импорта фотографий
  darktable # Приложение для импорта и обработки фотографий
# entangle # Управление камерой и захват (использует libgphoto2)
# libgphoto2 # Библиотека для доступа к цифровым камерам 

# --== Приложения для интернет ==--
  firefox
  google-chrome
  filezilla # FTP Клиент

# --== Офисные Приложения ==--
  libreoffice-fresh # Офисные приложения (Word, Excell, ...)
  gedit

# --== Игры ==--
  gnome.iagno # go game

# --== Расширения "GNOME Tweaks" ==--
  gnome.gnome-tweaks # Настройка Расширений "GNOME Tweaks"
  gnome.gpaste # Расширение для буфера обмена
  gnomeExtensions.net-speed-simplified # Индигатор скрости сети
  gnomeExtensions.tiling-assistant
  gnomeExtensions.tophat # Индигатор системных ресуров
  libgtop # Библиотека считывающая информацию о процессах системы 
# gnomeExtensions.weather-oclock
  ];

#======================================================#
# Удаление GNOME приложений установленных по умолчанию #
#======================================================#

environment.gnome.excludePackages = (with pkgs; [
# gnome-photos
  gnome-tour
]) ++ (with pkgs.gnome; [
  cheese # webcam tool
  gnome-music
  gnome-terminal
  gedit # text editor
  epiphany # web browser
  geary # email reader
  evince # document viewer
# gnome-characters
  totem # video player
  gnome-calendar
  yelp # Gnome Help
  gnome-contacts
  gnome-maps
  simple-scan
  baobab
  gnome-logs
]);

#=========================================================#
# NixOS имеет простой фаерволе с отслеживанием состояния. #
#    Он блокирует входящие соединения и другие пакеты.    #
#        --== Фаерволе включен по умолчанию ==--          #
#=========================================================#

  # Фаервол можно отключить следующим образом (не рекомендуется): 
  # networking.firewall.enable = false;
  # --== Или открыть порты ==--
  # Порты TCP можно открыть через:
  # networking.firewall.allowedTCPPorts = [ 80 443 22];
  # Или можно открыть диапазоны TCP-портов:
  # networking.firewall.allowedTCPPortRanges = [
  #    { from = 4000; to = 4007; }
  #    { from = 8000; to = 8010; }
  # ];
  # Порты UDP можно открыть через:
  # networking.firewall.allowedUDPPorts = [ 80 443 22];
  # Или можно открыть диапазоны UDP-портов:
  # networking.firewall.allowedUDPPorts = [
  #    { from = 4000; to = 4007; }
  #    { from = 8000; to = 8010; }
  # ];
  # Обратите внимание, что TCP-порт 22 (ssh) открывается 
  # автоматически, если демон SSH включен.

#==========================================================================#
# Это значение определяет версию NixOS, из которой были взяты настройки по #
# умолчанию для данных с отслеживанием состояния, таких как расположение   #
# файлов и версии базы данных в вашей системе. Это совершенно нормально,   #
# и рекомендуется оставить это значение в версии первой установки этой     #
# системы. Прежде чем изменить это значение, прочтите документацию по этой #
# опции: https://nixos.org/manual/nixos/stable/#sec-upgrading              #
# Список каналов: https://channels.nixos.org/                              #
#==========================================================================#
  system.stateVersion = "23.05";
}
