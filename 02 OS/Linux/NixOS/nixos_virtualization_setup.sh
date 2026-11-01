#!/usr/bin/env bash

CONFIG_FILE="/etc/nixos/configuration.nix"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root or with sudo"
  exit
fi

function pause(){
   read -p "$*"
}

function nixos_rebuild() {
  echo "Do you wish to run 'nixos-rebuild switch' now?"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) nixos-rebuild switch; break;;
          No ) break;;
      esac
  done
}

function enable_virtualbox() {
  sed -i "/^}/d" $CONFIG_FILE
  sed -i "/nixpkgs.config.allowUnfree = true;/d" $CONFIG_FILE
  echo "nixpkgs.config.allowUnfree = true;" >> $CONFIG_FILE
  echo "virtualisation.virtualbox.host.enable = true;" >> $CONFIG_FILE
  echo "Enter the user you want to have access to VirtualBox:"
  read vbox_user
  echo "users.extraGroups.vboxusers.members = [ \"$vbox_user\" ];" >> $CONFIG_FILE
  echo "virtualisation.virtualbox.host.enableExtensionPack = true;" >> $CONFIG_FILE
  echo "virtualisation.virtualbox.guest.enable = true;" >> $CONFIG_FILE
  echo "virtualisation.virtualbox.guest.x11 = true;" >> $CONFIG_FILE
  echo "}" >> $CONFIG_FILE
  nixos_rebuild
}

function disable_virtualbox() {
  sed -i "/virtualisation.virtualbox.host.enable = true;/d" $CONFIG_FILE
  sed -i "/users.extraGroups.vboxusers.members = .*/d" $CONFIG_FILE
  sed -i "/virtualisation.virtualbox.host.enableExtensionPack = true;/d" $CONFIG_FILE
  sed -i "/virtualisation.virtualbox.guest.enable = true;/d" $CONFIG_FILE
  sed -i "/virtualisation.virtualbox.guest.x11 = true;/d" $CONFIG_FILE
  nixos_rebuild
}

function enable_docker() {
  if grep -q "virtualisation.podman.enable = true;" $CONFIG_FILE; then
    sed -i "/virtualisation.podman.enable = true;/d" $CONFIG_FILE
  fi
  sed -i "/^}/d" $CONFIG_FILE
  echo "virtualisation.docker.enable = true;" >> $CONFIG_FILE
  echo "}" >> $CONFIG_FILE
  nixos_rebuild
}

function enable_podman() {
  if grep -q "virtualisation.docker.enable = true;" $CONFIG_FILE; then
    sed -i "/virtualisation.docker.enable = true;/d" $CONFIG_FILE
  fi
  sed -i "/^}/d" $CONFIG_FILE
  echo "virtualisation.podman.enable = true;" >> $CONFIG_FILE
  echo "}" >> $CONFIG_FILE
  nixos_rebuild
}

function disable_docker_podman() {
  sed -i "/virtualisation.docker.enable = true;/d" $CONFIG_FILE
  sed -i "/virtualisation.podman.enable = true;/d" $CONFIG_FILE
  nixos_rebuild
}

function enable_kvm() {
  sed -i "/^}/d" $CONFIG_FILE
  echo "boot.kernelModules = [ \"kvm-amd\" \"kvm-intel\" ];" >> $CONFIG_FILE
  echo "virtualisation.libvirtd.enable = true;" >> $CONFIG_FILE
  echo "}" >> $CONFIG_FILE
  echo "Enter the user you wish to add to the libvirtd group:"
  read libvirt_user
  usermod -aG libvirtd $libvirt_user
  nixos_rebuild
}

function disable_kvm() {
  sed -i "/boot.kernelModules = .*/d" $CONFIG_FILE
  sed -i "/virtualisation.libvirtd.enable = true;/d" $CONFIG_FILE
  nixos_rebuild
}

function main_menu() {
  clear
  echo "Thank you for using Gosh-Its-Arch post NixOS install script"
  echo "Select the option:"
  echo "1) Enable VirtualBox (Non-Free)"
  echo "2) Disable VirtualBox (Non-Free)"
  echo "3) Enable Docker"
  echo "4) Enable Podman"
  echo "5) Disable Docker/Podman"
  echo "6) Enable KVM"
  echo "7) Disable KVM"
  echo "8) Add user to libvirtd group"
  echo "0) Exit"

  read choice

  case $choice in
     1) enable_virtualbox;;
     2) disable_virtualbox;;
     3) enable_docker;;
     4) enable_podman;;
     5) disable_docker_podman;;
     6) enable_kvm;;
     7) disable_kvm;;
     8) 
        echo "Enter the user you wish to add to the libvirtd group:"
        read libvirt_user
        usermod -aG libvirtd $libvirt_user
        nixos_rebuild;;
     0) exit 0;;
     *) echo "Invalid option"; pause; return;;
  esac
}

while true; do main_menu; done
