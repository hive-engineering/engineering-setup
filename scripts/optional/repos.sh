#!/usr/bin/env bash

clone_repositories() {
    echo "----------------------------------------------------------------"
    echo "Available Hive repositories:"
    echo "----------------------------------------------------------------"
    echo "1. fc-app: Fulfilment centre facing app"
    echo "2. merchant-app: Merchant facing app (Hive Portal)"
    echo "3. frontend-shared: Shared components package"
    echo "4. post-purchase-app: Post purchase focused app"
    echo "5. hivecore: Backend serving the core feature of Hive"
    echo "----------------------------------------------------------------"
    read -rp "Clone repositories? (y/n): " clone_repos
    if [[ "$clone_repos" =~ ^[Yy]$ ]]; then
        # Make an ~/hive-projects dir if it doesn't exist
        mkdir -p ~/hive-projects
        cd ~/hive-projects || exit

        echo "🌐  Cloning fc-app..."
        git clone https://github.com/hive-engineering/fc-app.git || echo "Repo fc-app already cloned or error."

        echo "🌐  Cloning merchant-app..."
        git clone https://github.com/hive-engineering/merchant-app.git || echo "Repo merchant-app already cloned or error."

        echo "🌐  Cloning frontend-shared..."
        git clone https://github.com/hive-engineering/frontend-shared.git || echo "Repo frontend-shared already cloned or error."

        echo "🌐  Cloning post-purchase-app..."
        git clone https://github.com/hive-engineering/post-purchase-app.git || echo "Repo post-purchase-app already cloned or error."

        echo "🌐  Cloning hivecore..."
        git clone git@github.com:hive-engineering/hivecore.git || echo "Repo hivecore already cloned or error."
    fi
} 