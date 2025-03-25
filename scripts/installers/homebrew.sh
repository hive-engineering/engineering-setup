#!/usr/bin/env bash

install_homebrew() {
    if ! command -v brew &>/dev/null; then
        echo "🍺  Homebrew not found. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "✅  Homebrew installed!"
        echo "🔄  Updating your shell configuration to include brew in the PATH..."
        echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "✅  Homebrew already installed."
        echo "🔄  Updating Homebrew and formulas..."
        brew update
    fi
} 