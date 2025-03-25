#!/usr/bin/env bash
#
# Hive Engineering Onboarding Setup Script
# ----------------------------------------
# This script automates installation of common packages, tools, and environment
# setups for new engineers. It's designed for macOS + zsh, but can be adapted.

# Execute the main script from the scripts/core directory
"$(dirname "$0")/scripts/core/main.sh" "$@"