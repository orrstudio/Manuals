#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

CONFIG_FILE="/etc/nixos/configuration.nix"

insert_before_last_brace() {
    sed -i "/^}$/i $1" "$CONFIG_FILE"
}

echo "Thank you for using Gosh-Its-Arch post NixOS install script"

ask_rebuild() {
    read -p "Would you like to perform a nixos-rebuild switch now? (Y/n): " confirm
    [[ $confirm == "Y" || $confirm == "y" || $confirm == "" ]] && nixos-rebuild switch
}

enable_flatpaks() {
    insert_before_last_brace "services.flatpak.enable = true;"
}

enable__flathub() {
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

set_dns() {
    read -p "Enter the custom DNS IP: " dns_ip
    insert_before_last_brace "environment.etc = { \"resolv.conf\".text = \"nameserver $dns_ip\"; };"
}

disable_dns() {
    sed -i "/environment.etc = { \"resolv.conf\".text = \"nameserver .*\"; };/d" "$CONFIG_FILE"
}

garbage_collection() {
    echo "1) Delete unreachable store objects"
    echo "2) Delete all old generations of all profiles (Warning: This option will erase old configurations)"
    read -p "Choose an option: " gc_choice

    case $gc_choice in
        1) nix-collect-garbage; ask_rebuild;;
        2)
            read -p "Are you sure? (Y/n): " gc_confirm
            [[ $gc_confirm == "Y" || $gc_confirm == "y" ]] && nix-collect-garbage -d && ask_rebuild
            ;;
    esac
}

show_menu() {
    clear
    echo "1) Enable FlatpakService"
    echo "1) Enable AddFlathubRepo"
    echo "3) Set Custom DNS Resolver"
    echo "4) Disable Custom DNS Resolver"
    echo "5) Garbage Collection (Del old points)"
    echo "0) Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) enable_flatpaks; ask_rebuild;;
        2) enable_flathub; ask_rebuild;;
        3) set_dns; ask_rebuild;;
        4) disable_dns; ask_rebuild;;
        5) garbage_collection;;
        0) exit 0;;
        *) echo "Invalid option";;
    esac
    show_menu
}

show_menu
