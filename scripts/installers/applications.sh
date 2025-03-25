#!/usr/bin/env bash

install_applications() {
    echo "----------------------------------------------------------------"
    echo "Checking and installing macOS apps if needed..."
    echo "----------------------------------------------------------------"

    # Function to check and install a cask
    install_cask() {
        local app_name=$1
        local cask_name=$2
        local app_path=$3

        if [ "$FORCE_INSTALL" = true ]; then
            echo "🔄  Force reinstalling $app_name..."
            brew reinstall --cask "$cask_name" || echo "⚠️  $app_name installation failed or was interrupted. You can install it manually later."
        elif [ -d "$app_path" ]; then
            echo "✅  $app_name is already installed"
        else
            echo "📦  Installing $app_name..."
            brew install --cask "$cask_name" || echo "⚠️  $app_name installation failed or was interrupted. You can install it manually later."
        fi
    }

    # Install Docker
    install_cask "Docker" "docker" "/Applications/Docker.app"

    # Install AWS VPN Client
    install_cask "AWS VPN Client" "aws-vpn-client" "/Applications/AWS VPN Client/AWS VPN Client.app"

    # Install Visual Studio Code
    install_cask "Visual Studio Code" "visual-studio-code" "/Applications/Visual Studio Code.app"
} 