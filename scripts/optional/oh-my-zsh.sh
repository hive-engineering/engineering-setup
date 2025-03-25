#!/usr/bin/env bash

install_oh_my_zsh() {
    read -rp "Install oh-my-zsh? (y/n): " install_zsh
    if [[ "$install_zsh" =~ ^[Yy]$ ]]; then
        if [[ -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
            echo "✅  oh-my-zsh already installed, skipping."
        else
            echo "⚙️  Installing oh-my-zsh..."
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
            echo "✅  oh-my-zsh installed!"
        fi
    fi
} 