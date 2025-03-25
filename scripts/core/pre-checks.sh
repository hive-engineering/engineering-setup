#!/usr/bin/env bash

run_pre_checks() {
    # Only proceed if macOS
    if [[ $(uname) != "Darwin" ]]; then
        echo "❌  This script is intended for macOS only. Exiting..."
        exit 1
    fi

    # Install Xcode Command Line Tools if not present
    if ! xcode-select -p &>/dev/null; then
        echo "⚙️  Installing Xcode Command Line Tools..."
        xcode-select --install || true
    fi
} 