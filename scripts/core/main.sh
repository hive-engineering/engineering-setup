#!/usr/bin/env bash

set -euo pipefail

# Parse command line arguments
FORCE_INSTALL=false
for arg in "$@"; do
    case $arg in
        --force)
            FORCE_INSTALL=true
            shift # Remove --force from processing
            ;;
    esac
done

# Export the force flag for other scripts
export FORCE_INSTALL

# Source helper functions
source "$(dirname "$0")/../utils/helpers.sh"

# Source all modules
source "$(dirname "$0")/pre-checks.sh"
source "$(dirname "$0")/../installers/homebrew.sh"
source "$(dirname "$0")/../installers/cli-tools.sh"
source "$(dirname "$0")/../installers/applications.sh"
source "$(dirname "$0")/../optional/oh-my-zsh.sh"
source "$(dirname "$0")/../optional/asdf.sh"
source "$(dirname "$0")/../utils/aws.sh"
source "$(dirname "$0")/../optional/repos.sh"

#------------------------
# 0. PRE-CHECKS & INTRO
#------------------------
echo "----------------------------------------------------------------"
echo "💻  Hive Engineering Onboarding Script"
echo "----------------------------------------------------------------"
echo "This script will install essential tools (Homebrew, awscli, Docker, etc.)"
echo "and optionally set up oh-my-zsh, asdf, and local repos."
echo ""
if [ "$FORCE_INSTALL" = true ]; then
    echo "⚠️  Running in force mode - will reinstall all tools even if already installed"
else
    echo "Note: This script is safe to run multiple times. It will:"
    echo "- Skip already installed tools"
    echo "- Update existing tools if needed"
    echo "- Only install missing components"
    echo "Tip: Use --force to reinstall all tools"
fi
echo ""
echo "Proceed? (Ctrl+C to abort at any time)"
echo "----------------------------------------------------------------"

# Run pre-checks
run_pre_checks

#------------------------
# 1. INSTALL HOMEBREW
#------------------------
install_homebrew

#------------------------
# 2. INSTALL ESSENTIAL CLI TOOLS
#------------------------
install_cli_tools

#------------------------
# 3. INSTALL APPLICATIONS (CASKS)
#------------------------
install_applications

#------------------------
# 4. OPTIONAL: OH-MY-ZSH
#------------------------
install_oh_my_zsh

#------------------------
# 5. OPTIONAL: ASDF VERSION MANAGER
#------------------------
install_asdf

#------------------------
# 6. CONFIGURE AWS CLI AUTOCOMPLETION
#------------------------
configure_aws_cli

#------------------------
# 7. OPTIONAL: CLONE REPOS
#------------------------
clone_repositories

#------------------------
# 8. WRAP-UP
#------------------------
echo "----------------------------------------------------------------"
echo "🎉  Setup complete!"
echo "----------------------------------------------------------------"
echo "Next steps:"
echo "1. Open a new terminal or run 'exec zsh' to load updates."
echo "2. Verify you can run 'aws', 'docker', 'terraform', 'git' commands."
echo "3. If you installed oh-my-zsh, customize your ~/.zshrc as desired."
echo "4. If you installed asdf, read usage instructions at https://asdf-vm.com."
echo "5. Check 'fc-app', 'merchant-app', 'frontend-shared' repos for README instructions."
echo "----------------------------------------------------------------" 