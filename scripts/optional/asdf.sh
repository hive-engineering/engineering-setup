#!/usr/bin/env bash

install_asdf() {
    read -rp "Install asdf (version manager)? (y/n): " install_asdf
    if [[ "$install_asdf" =~ ^[Yy]$ ]]; then
        if ! command -v asdf &>/dev/null; then
            echo "⚙️  Installing asdf..."
            brew install asdf
            # Ensure shell integration (for zsh)
            if ! grep -q "asdf.sh" ~/.zshrc; then
                echo "[ -f $(brew --prefix asdf)/libexec/asdf.sh ] && . $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
            fi
            echo "✅  asdf installed! Run 'exec zsh' or open a new terminal to apply."
        else
            echo "✅  asdf already installed."
        fi
    fi
} 