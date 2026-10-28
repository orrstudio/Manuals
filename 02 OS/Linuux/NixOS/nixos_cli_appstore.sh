#!/usr/bin/env bash

CONFIG_PATH="/etc/nixos/configuration.nix"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as sudo or as root."
    exit 1
fi

prompt_rebuild() {
    read -p "Would you like to run nixos-rebuild switch now? (y/n): " rebuild_choice
    if [[ $rebuild_choice == "y" || $rebuild_choice == "Y" ]]; then
        nixos-rebuild switch
    fi
}

while true; do
    clear
    echo "Thank you for using NixOS CLI App Store"
    echo ""
    echo "1) Show Installed Applications"
    echo "2) Add Applications"
    echo "3) Remove Applications"
    echo "4) Add or Remove with packages.txt"
    echo "5) Run nixos-rebuild switch"
    echo "0) Exit this Script"
    read -p "Select an option: " choice

    case $choice in

        1)
            echo "Installed Applications:"
            sed -n '/environment.systemPackages = with pkgs; \[/,/\]/p' "$CONFIG_PATH" | sed '1d;$d' | sed 's/^[ \t]*//' | sed '/^#/d'
            read -p "Press any key to continue..."
            ;;

        2)
            echo "Enter names of applications you'd like to add, separated by spaces (e.g., firefox vlc): "
            read -a app_names
            for app in "${app_names[@]}"; do
                app=$(echo "$app" | sed 's/^pkgs\.//')
                sed -i "/environment.systemPackages = with pkgs; \[/a\    $app" "$CONFIG_PATH"
            done
            echo "Applications have been added!"
            prompt_rebuild
            ;;

        3)
            echo "Enter names of applications you'd like to remove, separated by spaces (e.g., firefox vlc): "
            read -a app_names
            for app in "${app_names[@]}"; do
                app=$(echo "$app" | sed 's/^pkgs\.//')
                sed -i "/^    $app$/d" "$CONFIG_PATH"
            done
            echo "Applications have been removed!"
            prompt_rebuild
            ;;

        4) 
            if [[ ! -f "./packages.txt" ]]; then
                echo "Error: Can't find packages.txt in the current directory!"
                read -p "Press any key to return to the main menu..."
                continue
            fi

            echo "Would you like to:"
            echo "1) Add applications from packages.txt"
            echo "2) Remove applications listed in packages.txt"
            echo "3) Return to Main Menu"
            read -p "Enter choice (1/2/3): " txt_choice

            case $txt_choice in
                1)
                    while IFS= read -r pkg; do
                        pkg=$(echo "$pkg" | sed 's/^pkgs\.//')
                        sed -i "/environment.systemPackages = with pkgs; \[/a\    $pkg" "$CONFIG_PATH"
                    done < "./packages.txt"
                    echo "Applications from packages.txt have been added!"
                    prompt_rebuild
                    ;;

                2)
                    while IFS= read -r pkg; do
                        pkg=$(echo "$pkg" | sed 's/^pkgs\.//')
                        sed -i "/^    $pkg$/d" "$CONFIG_PATH"
                    done < "./packages.txt"
                    echo "Applications from packages.txt have been removed!"
                    prompt_rebuild
                    ;;

                3)
                    echo "Returning to the main menu."
                    ;;

                *)
                    echo "Invalid choice!"
                    ;;
            esac
            ;;

        5) 
            nixos-rebuild switch
            ;;

        0)
            echo "Goodbye!"
            exit 0
            ;;

        *)
            echo "Invalid option!"
            ;;
    esac
done
