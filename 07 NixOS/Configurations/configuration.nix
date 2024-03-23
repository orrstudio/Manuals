#***ENG****************************************************************#
#                                                                      #
# Edit this configuration file to define what should be installed on   #
# your system.  Help is available in the configuration.nix(5) man page #
# and in the NixOS manual (accessible by running ‘nixos-help’).        #
#                                                                      #
#***RUS****************************************************************#
#                                                                      #
# Отредактируйте этот файл конфигурации, чтобы определить, что должно  #
# быть установлено в вашей системе. Справка доступна на странице       #
# руководства configuration.nix(5) и в руководстве NixOS (доступно     #
# при запуске ‘nixos-help’).                                           #
#                                                                      #
#**********************************************************************#


{ config, pkgs, ... }:

{
  imports =
    [ 
    
    # Include the results of the hardware scan.
    # Подключение файла конфигурации оборудования.
    # --------------------------------------------
      ./hardware-configuration.nix
      
    ];


  # Bootloader / Загрузчик
  #
  # --EFI------
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  #
  # --GRUB-----
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;


  # Your host name. 
  # Имя ващего хоста.
  # -----------------------
    networking.hostName = "nixos"; 


  # Enable Ethernet Networking
  # Включение сети Ethernet
  # -----------------------
    networking.networkmanager.enable = true;


  # Enables Wireless Network.
  # Включение беспроводной сети.
  # --------------------------------------
    networking.wireless.enable = true;  


  # Proxy Settings
  # Настройка прокси
  # --------------------------------------
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Timezone.
  # Часовой пояс.
  # -------------------------
  # time.timeZone = "America/Los_Angeles";
  # time.timeZone = "Russia/Moscow";
    time.timeZone = "Asia/Baku";


  # Regional settings.
  # Региональные настройки.
  # -----------------------
  # i18n.defaultLocale = "en_US.UTF-8";
  #
  # i18n.extraLocaleSettings = {
  #   LC_ADDRESS = "en_US.UTF-8";
  #   LC_IDENTIFICATION = "en_US.UTF-8";
  #   LC_MEASUREMENT = "en_US.UTF-8";
  #   LC_MONETARY = "en_US.UTF-8";
  #   LC_NAME = "en_US.UTF-8";
  #   LC_NUMERIC = "en_US.UTF-8";
  #   LC_PAPER = "en_US.UTF-8";
  #   LC_TELEPHONE = "en_US.UTF-8";
  #   LC_TIME = "en_US.UTF-8";
  # };
  #

    i18n.defaultLocale = "ru_RU.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "az_AZ";
      LC_IDENTIFICATION = "az_AZ";
      LC_MEASUREMENT = "az_AZ";
      LC_MONETARY = "az_AZ";
      LC_NAME = "az_AZ";
      LC_NUMERIC = "az_AZ";
      LC_PAPER = "az_AZ";
      LC_TELEPHONE = "az_AZ";
      LC_TIME = "az_AZ";
    };


#==========================================#
# Desktop Enviroment Configuration Section #
# Раздел конфигурации среды рабочего стола #
#==========================================#


  # Enable the X11 windowing system.
  # Включение оконной системы X11.
  # --------------------------------
    services.xserver.enable = true;


  # Configure keymap in X11
  # Настройка раскладки клавиатуры в X11
  # ------------------------------------
    services.xserver = {
      layout = "us,ru,az";
      xkbVariant = "";
    };


  # Enable the GNOME Desktop Environment.
  # Включите среду рабочего стола GNOME.
  # -------------------------------------
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  #
  # Enable KDE Plasma
  # Включите KDE Plasma
  # -------------------
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  #
  # Enable MATE Desktop
  # Включите рабочий стол MATE
  # --------------------------
  # services.xserver.desktopManager.mate.enable = true;
  #
  # Enable XFCE Desktop
  # Включите рабочий стол XFCE
  # --------------------------
  # services.xserver.desktopManager.xfce.enable = true;
  #
  # Enable Pantheon Desktop
  # Включите рабочий стол Pantheon
  # ------------------------------
  # services.xserver.desktopManager.pantheon.enable = true;
  #
  # Enable Cinnamon Desktop
  # Включите рабочий стол Cinnamon
  # ------------------------------
  # services.xserver.desktopManager.cinnamon.enable = true;


  # Enable CUPS to print documents.
  # Включите CUPS для печати документов.
  # ------------------------------------
  # services.printing.enable = true;


  # Enable sound with Pipewire.
  # Включите звук с помощью Pipewire.
  # ---------------------------------
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    # Если вы хотите использовать приложения JACK, 
    # раскомментируйте это
    # ----------------------------------------------------
    # jack.enable = true;

  # use the example session manager (no others are packaged yet 
  # so this is enabled by default, no need to redefine it 
  # in your config for now)
  # используйте пример менеджера сеансов (другие еще не упакованы, 
  # поэтому он включен по умолчанию, пока нет необходимости 
  # переопределять его в вашей конфигурации)
  # --------------------------------------------------------------
  # media-session.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # Включить поддержку сенсорной панели (включено по умолчанию 
  # в большинстве DesktopManager).
  # -----------------------------------------------------------------
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # Определние учетной записи пользователя. 
  # Не забудьте установить пароль с помощью ‘passwd’.
  # --------------------------------------------------------------------
    users.users.orr = {
    isNormalUser = true;
    description = "Oruc Qafarov";
    extraGroups = [ "networkmanager" "wheel" ];
    # Applications for current user:
    # Приложения для текущуго пользователей:
    # -----------------------------------------
    packages = with pkgs; [
    # firefox
    # htop
    ];
  };


  # Enable automatic login for the user.
  # Включите автоматический вход пользователя.
  # ------------------------------------------
    services.xserver.displayManager.autoLogin.enable = true;
    services.xserver.displayManager.autoLogin.user = "orr";


  # Workaround for GNOME autologin:
  # Обходной путь для автоматического входа в GNOME:
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  # ---------------------------------------------------------------------
    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;


  # Allow unfree packages
  # Разрешить несвободные пакеты
  # ----------------------------
    nixpkgs.config.allowUnfree = true;


#============================================#
# Applications for all users!                #
# Приложения для всех пользователей!         #
#============================================#
# Список пакетов, установленных в системе.   #
# Для поиска выполните: $ nix search wget    #
# Или выполните поиск на сайте:              #
# https://search.nixos.org/packages          #
#============================================#

  environment.systemPackages = with pkgs; [
  
# SYSTEM APPS:
# СИСТЕМНЫЕ ПРИЛОЖЕНИЯ:
# ---------------------
# The Nano editor is also installed by default.
# Редактор Nano установлен в системе по умолчанию.
# ------------------------------------------------
# vim # Терминальный текстовый редактор
  wget # Инструмент для получения файлов с использованием HTTP, HTTPS и FTP
  htop # Интерактивный просмотрщик процессов
  neofetch # Инструмент системной информации
  gnome.gnome-tweaks # Графический интерфейс для расширенных настроек GNOME.
# pantheon-tweaks # Панель системных настроек для Pantheon Desktop. 

  firefox
  google-chrome
  filezilla
  python311
  python311Packages.pip
# vlc
# distrobox
# kitty
# kitty-themes  
# cool-retro-term
# appimage-run
# discord
# vscode-with-extensions
# obs-studio
# obs-studio-plugins.wlrobs
# obs-studio-plugins.obs-vaapi
# obs-studio-plugins.obs-pipewire-audio-capture
# obs-studio-plugins.advanced-scene-switcher
# obs-studio-plugins.obs-backgroundremoval
# obs-studio-plugins.obs-vintage-filter
# libreoffice-fresh
# shortwave
# ripdrag
# calibre
# joplin-desktop
# openshot-qt
# nextcloud-client
# cider
# audacious
# dosbox
# ytmdesktop
# qbittorrent
# gpodder
# uget
# space-cadet-pinball
# brave
# openarena
# superTux
# superTuxKart
# extremetuxracer
# chromium-bsu
# hedgewars
# rclone
# rclone-browser
# appimage-run
# virt-manager
# _1password-gui
# microsoft-edge
# podman
# exa
# bat
# duf
# cmatrix
# figlet
# fortune
# evolutionWithPlugins
# ulauncher
# virt-manager
# tldr
# mate.pluma
# gitkraken
# hplip
# emacs

  ];


#=====================================================#
# Some programs need SUID wrappers, can be configured #
# further or are started in user sessions.            #
# Некоторым программам требуются оболочки SUID, их    #
# можно настроить дополнительно или они запускаются   #
# в пользовательских сеансах.                         #
#=====================================================#


  # programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
  #   enableSSHSupport = true;
    };


#==============================================#
# List services that you want to enable:       #
# Список сервисов, которые вы хотите включить: #
#==============================================#


  # Enable Flatpak service.
  # Включить сервис Flatpak.
  # ------------------------
  services.flatpak.enable =true;


  # Enable the OpenSSH daemon.
  # Включите демон OpenSSH.
  # --------------------------
  # services.openssh.enable = true;


#=========================================================#
# NixOS имеет простой фаерволе с отслеживанием состояния, #
# который блокирует входящие соединения и другие          #
# неожиданные пакеты. Фаерволе применяется как к IPv4,    #
# так и к IPv6.                                           #
# ------------------------------------------------------- #
#                Он включен по умолчанию.                 #
#=========================================================#


  # Фаервол можно отключить следующим образом (не рекомендуется): 
  # -------------------------------------------------------------
  # networking.firewall.enable = false;


  # Или открыть порты:
  #
  # Порты TCP можно открыть через:
  # ----------------------------------------------------
  # networking.firewall.allowedTCPPorts = [ 80 443 22];
  #
  # ****************************************************
  # Обратите внимание, что TCP-порт 22 (ssh) открывается 
  # автоматически, если демон SSH включен.
  # ****************************************************
  #
  # Или можно открыть диапазоны TCP-портов:
  # ----------------------------------------------------
  # networking.firewall.allowedTCPPortRanges = [
  #    { from = 4000; to = 4007; }
  #    { from = 8000; to = 8010; }
  # ];
  #
  #
  # Порты UDP можно открыть через:
  # ------------------------------
  # networking.firewall.allowedUDPPorts = [ 80 443 22];
  #
  # Или можно открыть диапазоны UDP-портов:
  # ----------------------------------------------------
  # networking.firewall.allowedUDPPorts = [
  #    { from = 4000; to = 4007; }
  #    { from = 8000; to = 8010; }
  # ];


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


#=============================#
# Setting custom DNS resolver #
#=============================#


  # environment.etc = {
  #   "resolv.conf".text = "nameserver 192.168.0.35";
  # };


#===================================#
# Enabling virtualisation using KVM #
#===================================#


  # boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  # virtualisation.libvirtd.enable = true;


#=========================================#
# xdg additional config for MATE and XFCE #
#=========================================#


  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.enable = true;
  # programs.nm-applet.enable = true;


#=========================================#
#            И прочие настройки           #
#=========================================#


  # programs.pantheon-tweaks.enable = true;
  # virtualisation.podman.enable = true; 
  # virtualisation.docker.enable = true;


}
