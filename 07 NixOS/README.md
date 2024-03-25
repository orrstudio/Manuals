Проверьте конфигурацию Bluetooth в NixOS. Убедитесь, что в вашем файле конфигурации /etc/nixos/configuration.nix включена поддержка Bluetooth1. Вот пример того, как это может выглядеть:

hardware.bluetooth.enable = true; # включает поддержку Bluetooth
hardware.bluetooth.powerOnBoot = true; # включает Bluetooth при загрузке



# NixOS Scripts / Скрипты NixOS


These scripts are meant to make NixOS Linux easier to manage / get up and running!  
These are not official scripts. Remember you using these at your own risk.  
Эти сценарии предназначены для того, чтобы упростить управление и запуск NixOS Linux!  
Это не официальные скрипты. Помните, что вы используете их на свой страх и риск.  


Сделайте скрипт исполняемым:
```bash
sudo chmod +x script.sh
```
Запустите скрипт от имени пользователя root:  
```bash
sudo ./script.sh
```


## What Scripts does / Что делают скрипты


## nixos_cli_appstore.sh


- Custom build NixOS app store using command line. It can add/remove applications. Works by editing the global section of configuration.nix file  
- Пользовательская сборка магазина приложений NixOS с использованием командной строки. Он может добавлять/удалять приложения. Работает путем редактирования глобального раздела файла configuration.nix  


## nixos_gui_changer.sh  


- Use this after installing NixOS it allows you to change your desktop enviroment from one system to another (GNOME, KDE, XFCE, MATE, Pantheon, Cinnamon). If you use this and the screen goes blank; its because its removed your existing GUI. In this case login to terminal and run nixos-rebuild switch.  
- Используйте это после установки NixOS, оно позволяет вам менять среду рабочего стола с одной системы на другую (GNOME, KDE, XFCE, MATE, Pantheon, Cinnamon). Если вы используете это, экран погаснет; это потому, что он удалил ваш существующий графический интерфейс. В этом случае войдите в терминал и запустите переключатель nixos-rebuild.  


## nixos_postinstall.sh  


- Easier way for some post intall functions (Flatpak, Custom DNS Resolver, Garbage Collection). Use with CAUTION!
- Более простой способ для некоторых функций публикации (Flatpak, Custom DNS Resolver, Сбор мусора). Используйте с осторожностью!  


## nixos_virt_setup.sh  


- Allows you to install VirtualBox, KVM (and add user to libvirtd group), Docker & Podman,  easily on NixOS.
- Позволяет легко установить VirtualBox, KVM (и добавить пользователя в группу libvirtd), Docker и Podman на NixOS.
