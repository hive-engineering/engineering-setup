#!/usr/bin/env bash

configure_aws_cli() {
    if command -v aws &>/dev/null; then
        echo "----------------------------------------------------------------"
        echo "Enabling AWS CLI autocomplete..."
        echo "----------------------------------------------------------------"
        aws_completer_path=$(command -v aws_completer || true)
        if [[ -n "$aws_completer_path" ]]; then
            # Shell config for zsh
            if ! grep -q "complete -C $aws_completer_path aws" ~/.zshrc; then
                echo "complete -C $aws_completer_path aws" >> ~/.zshrc
                echo "✅  AWS CLI autocompletion enabled in .zshrc"
            else
                echo "✅  AWS CLI autocompletion already in .zshrc"
            fi
        fi
    fi
} 