## NixOS Scripts (Recommended for FRESH NixOS install/default configuration.nix file)

Getting started
These scripts are meant to make NixOS Linux easier to manage / get up and running!
Remember you using these at your own risk. These are not official scripts please don't ask NixOS Linux team for help.
Scripts must be run as root/sudo!

Steps NixOS
Open up a terminal

- git clone https://github.com/orrstudio/nixos.git
- cd nixos
- cd scripts
- chmod +x *.sh

Once completed you should be able to run the individual scripts (All must be run as sudo)



What each file does


nixos_cli_appstore.sh -> Custom build NixOS app store using command line. It can add/remove applications. Works by editing the global section of configuration.nix file


nixos_gui_changer.sh -> Use this after installing NixOS it allows you to change your desktop enviroment from one system to another (GNOME, KDE, XFCE, MATE, Pantheon, Cinnamon). If you use this and the screen goes blank; its because its removed your existing GUI. In this case login to terminal and run nixos-rebuild switch


nixos_postinstall.sh -> Easier way for some post intall functions (Flatpak, Custom DNS Resolver, Garbage Collection). Use with CAUTION! 


nixos_virt_setup.sh -> Allows you to install VirtualBox, KVM (and add user to libvirtd group), Docker & Podman,  easily on NixOS.

