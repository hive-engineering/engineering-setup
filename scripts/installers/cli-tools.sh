#!/usr/bin/env bash

install_cli_tools() {
    echo "----------------------------------------------------------------"
    echo "Checking and installing CLI tools if needed..."
    echo "----------------------------------------------------------------"

    # Function to check and install a brew package
    check_and_install() {
        local package=$1
        if [ "$FORCE_INSTALL" = true ]; then
            echo "🔄  Force reinstalling $package..."
            brew reinstall "$package"
        elif brew list "$package" &>/dev/null; then
            echo "✅  $package is already installed"
            # Check for updates
            if brew outdated | grep -q "^$package"; then
                echo "🔄  Updating $package..."
                brew upgrade "$package"
            fi
        else
            echo "📦  Installing $package..."
            brew install "$package"
        fi
    }

    # Install each tool
    check_and_install "awscli"
    check_and_install "yq"
    check_and_install "terraform"
    check_and_install "libpq"
    check_and_install "coreutils"
    check_and_install "git"

    # Add Postgres client binaries to PATH if not already in zprofile
    if ! grep -q 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' ~/.zprofile || [ "$FORCE_INSTALL" = true ]; then
        echo "🔧  Updating PATH for Postgres client..."
        # Remove existing entry if force installing
        if [ "$FORCE_INSTALL" = true ]; then
            sed -i.bak '/export PATH="\/opt\/homebrew\/opt\/libpq\/bin:\$PATH"/d' ~/.zprofile
        fi
        echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zprofile
    else
        echo "✅  Postgres client is already in PATH"
    fi
} 