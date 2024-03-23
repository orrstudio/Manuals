#!/usr/bin/env bash

while true; do
    clear
    echo "Thank you for using Flatpak CLI App Store"
    echo "This script will modify installed flatpaks system-wide"
    echo ""
    echo "1) Application Search"
    echo "2) Show Installed Applications"
    echo "3) Add an Application"
    echo "4) Remove an Application"
    echo "5) Add Multiple Applications"
    echo "6) Remove Multiple Applications"
    echo "7) User Text File"
    echo "8) Exit"
    read -p "Select an option: " choice

    case $choice in
        1)
            read -p "Enter flatpak app or runtime name for search: " package_name
            echo "Searching for $package_name..."
            flatpak search "$package_name"
            read -p "Press any key to return to the main menu..."
            ;;

        2)
            echo "Installed Applications:"
            flatpak list
            read -p "Press any key to continue..."
            ;;

        3)
            read -p "Enter the name of the flatpak app you'd like to add (e.g., com.spotify.Client): " app_name
            flatpak install flathub "$app_name" -y
            ;;

        4)
            read -p "Enter the name of the flatpak app you'd like to remove: " app_name
            flatpak uninstall "$app_name" -y
            ;;

        5)
            echo "Enter names of flatpak apps you'd like to add, separated by spaces (e.g., com.spotify.Client org.telegram.desktop): "
            read -a app_names
            for app in "${app_names[@]}"; do
                flatpak install flathub "$app" -y
            done
            ;;

        6)
            echo "Enter names of flatpak apps you'd like to remove, separated by spaces (e.g., com.spotify.Client org.telegram.desktop): "
            read -a app_names
            for app in "${app_names[@]}"; do
                flatpak uninstall "$app" -y
            done
            ;;

        7)
            if [[ ! -f "./packages.txt" ]]; then
                echo "Error: Can't find packages.txt in the current directory!"
                read -p "Press any key to return to the main menu..."
                continue
            fi

            echo "Would you like to:"
            echo "1) Add flatpak apps from packages.txt"
            echo "2) Remove flatpak apps listed in packages.txt"
            echo "3) Return to Main Menu"
            read -p "Enter choice (1/2/3): " txt_choice

            case $txt_choice in
                1)
                    while IFS= read -r pkg; do
                        flatpak install flathub "$pkg" -y
                    done < "./packages.txt"
                    echo "Flatpak apps from packages.txt have been added!"
                    ;;

                2)
                    while IFS= read -r pkg; do
                        flatpak uninstall "$pkg" -y
                    done < "./packages.txt"
                    echo "Flatpak apps from packages.txt have been removed!"
                    ;;

                3)
                    echo "Returning to the main menu."
                    ;;

                *)
                    echo "Invalid choice!"
                    ;;
            esac
            ;;

        8)
            echo "Goodbye!"
            exit 0
            ;;

        *)
            echo "Invalid option!"
            ;;
    esac
done
