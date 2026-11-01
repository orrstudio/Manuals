#!/usr/bin/env bash

# Check for root or sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo"
    exit 1
fi

# Display warnings
echo "Thank you for using Gosh-Its-Arch NixOS GUI Changer"
echo "This script will modify your installed GUI system, use at your own risk!"

# Display options
echo "Please select a desktop environment:"
echo "1) GNOME"
echo "2) KDE"
echo "3) XFCE"
echo "4) MATE"
echo "5) Pantheon"
echo "6) Cinnamon"

read -p "Enter your choice: " choice

# Remove existing settings for a clean slate
sed -i '/services.xserver.displayManager.sddm.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.plasma5.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.displayManager.gdm.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.gnome.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.xfce.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.displayManager.lightdm.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.pantheon.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.mate.enable/d' /etc/nixos/configuration.nix
sed -i '/services.xserver.desktopManager.cinnamon.enable/d' /etc/nixos/configuration.nix
sed -i '/xdg.portal.extraPortals = \[ pkgs.xdg-desktop-portal-gtk \];/d' /etc/nixos/configuration.nix
sed -i '/xdg.portal.enable = true;/d' /etc/nixos/configuration.nix
sed -i '/programs.nm-applet.enable = true;/d' /etc/nixos/configuration.nix

# Add new settings based on the choice
case $choice in
    1)  # Gnome
        sed -i '/^}/i services.xserver.displayManager.gdm.enable = true;' /etc/nixos/configuration.nix
        sed -i '/^}/i services.xserver.desktopManager.gnome.enable = true;' /etc/nixos/configuration.nix
        ;;
    2)  # KDE
        sed -i '/^}/i services.xserver.displayManager.sddm.enable = true;' /etc/nixos/configuration.nix
        sed -i '/^}/i services.xserver.desktopManager.plasma5.enable = true;' /etc/nixos/configuration.nix
        ;;
    3|4|5)  # MATE, XFCE, Pantheon, 
        # DE-specific settings
        [[ "$choice" == "3" ]] && sed -i '/^}/i services.xserver.desktopManager.xfce.enable = true;' /etc/nixos/configuration.nix
        [[ "$choice" == "4" ]] && sed -i '/^}/i services.xserver.desktopManager.pantheon.enable = true;' /etc/nixos/configuration.nix
        [[ "$choice" == "5" ]] && sed -i '/^}/i services.xserver.desktopManager.mate.enable = true;' /etc/nixos/configuration.nix
        # Common settings
        sed -i '/^}/i services.xserver.displayManager.lightdm.enable = true;' /etc/nixos/configuration.nix
        sed -i '/^}/i xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];' /etc/nixos/configuration.nix
        sed -i '/^}/i xdg.portal.enable = true;' /etc/nixos/configuration.nix
        sed -i '/^}/i programs.nm-applet.enable = true;' /etc/nixos/configuration.nix
        ;;
    6)  # Cinnamon
        sed -i '/^}/i services.xserver.desktopManager.cinnamon.enable = true;' /etc/nixos/configuration.nix
        sed -i '/^}/i services.xserver.displayManager.lightdm.enable = true;' /etc/nixos/configuration.nix
        ;;
    *)
        echo "Invalid choice. No changes made."
        exit 1
        ;;
esac

# Always ensure xserver is enabled
sed -i '/services.xserver.enable = true;/d' /etc/nixos/configuration.nix  # Remove if it exists
sed -i '/^}/i services.xserver.enable = true;' /etc/nixos/configuration.nix  # Add it before the last }

# Prompt to rebuild the system
read -p "Would you like to rebuild the system now? (y/N): " rebuild
if [[ "$rebuild" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    nixos-rebuild switch
fi
