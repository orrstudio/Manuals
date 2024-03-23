#!/bin/bash

echo "Welcome to Arch applications installer"

# Ask the user if they want to check for yay and install if not present
read -p "Do you want to check if yay is installed and install it if it's not? (y/n): " check_yay_choice
if [[ "$check_yay_choice" =~ ^[Yy]$ ]]; then
    if ! command -v yay &> /dev/null; then
        echo "yay is not installed. Installing yay from official repository..."
        sudo pacman -S yay --noconfirm
    else
        echo "yay is already installed."
    fi
fi

# Define the list of AUR packages
declare -A aur_packages
aur_packages=(
    ["vlc"]="VLC"
    ["rofi"]="Rofi"
    ["pamac-aur"]="Pamac AUR"
    ["emacs"]="Emacs"
    ["vim"]="Vim"
    ["google-chrome"]="Google Chrome"
    ["brave-bin"]="Brave"
    ["firefox"]="Firefox"
    ["vivaldi"]="Vivaldi"
    ["nextcloud-client"]="Nextcloud Client"
    ["appimagelauncher"]="AppImageLauncher"
    ["discord_arch_electron"]="Discord Arch Electron"
    ["deluge"]="Deluge"
    ["filezilla"]="FileZilla"
    ["freedownloadmanager"]="Free Download Manager"
    ["thunderbird"]="Thunderbird"
    ["remmina"]="Remmina"
    ["1password"]="1Password"
    ["joplin-desktop"]="Joplin Desktop"
    ["libreoffice-fresh"]="LibreOffice Fresh"
    ["github-desktop-bin"]="GitHub Desktop"
    ["pycharm-community-edition"]="PyCharm Community Edition"
    ["visual-studio-code-bin"]="Visual Studio Code"
    ["audacity"]="Audacity"
    ["audacious"]="Audacious"
    ["obs-studio"]="OBS Studio"
    ["handbrake"]="HandBrake"
    ["kodi"]="Kodi"
    ["shortwave"]="Shortwave"
    ["openshot-git"]="OpenShot Git"
    ["htop"]="Htop"
    ["exa"]="Exa"
    ["bat"]="Bat"
    ["duf"]="Duf"
    ["cowsay"]="Cowsay"
    ["rclone"]="Rclone"
    ["rclone-browser"]="Rclone Browser"
    ["crossover"]="CrossOver"
    ["bottles"]="Bottles"
    ["protonup-qt"]="ProtonUp-Qt"
    ["expandrive-bin"]="ExpanDrive"
    ["steam"]="Steam"
    ["neofetch"]="Neofetch"
    ["misfortune"]="Fortune of the Day"
    ["shell-color-scripts"]="Shell Color Scripts"
)

# Function to display menu
display_menu() {
    echo "Choose an AUR package to install:"
    local counter=1
    for key in "${!aur_packages[@]}"; do
        echo "$counter) ${aur_packages[$key]}"
        ((counter++))
    done
    echo "$counter) Install all"
    echo "$((counter+1)) Exit"
}

# Main loop for menu interaction
while true; do
    display_menu

    read -p "Enter your choice: " choice

    selected_packages=() # Reset array 

    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -gt 0 ] && [ "$choice" -le "${#aur_packages[@]}" ]; then
        counter=1
        for key in "${!aur_packages[@]}"; do
            if [ "$choice" -eq "$counter" ]; then
                selected_packages=("$key")
                break
            fi
            ((counter++))
        done
    elif [ "$choice" -eq "$((${#aur_packages[@]}+1))" ]; then
        selected_packages=("${!aur_packages[@]}")
    elif [ "$choice" -eq "$((${#aur_packages[@]}+2))" ]; then
        echo "Exiting."
        exit 0
    else
        echo "Invalid choice!"
        continue
    fi

    # Install the selected packages using yay
    for package in "${selected_packages[@]}"; do
        echo "Installing $package from AUR..."
        yay -S $package --noconfirm
    done

    read -p "Would you like to continue? (y/n): " continue_choice
    if [[ "$continue_choice" =~ ^[Nn]$ ]]; then
        echo "Goodbye!"
        exit 0
    fi
done

