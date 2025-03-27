#!/usr/bin/env bash

configure_vpn() {
    echo "----------------------------------------------------------------"
    echo "VPN Configuration Guide"
    echo "----------------------------------------------------------------"
    
    # Check if TunnelBlick is installed
    if [ -d "/Applications/Tunnelblick.app" ]; then
        echo "✅ TunnelBlick is installed"
        echo ""
        echo "To configure your VPN:"
        echo "1. Obtain your OpenVPN configuration (.ovpn) file from the IT department"
        echo "2. Open TunnelBlick from Applications"
        echo "3. Drag and drop your .ovpn file into TunnelBlick"
        echo "4. Follow the on-screen instructions to complete the setup"
        echo ""
        echo "For more information, visit the TunnelBlick documentation:"
        echo "https://tunnelblick.net/documents.html"
    else
        echo "⚠️ TunnelBlick is not installed"
        echo "Run the setup script to install TunnelBlick:"
        echo "./setup.sh"
        echo "or"
        echo "brew install --cask tunnelblick"
    fi
    
    echo ""
    echo "For assistance with VPN configuration, contact the IT team."
    echo "----------------------------------------------------------------"
}

# The function can be called directly for instructions
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    configure_vpn
fi 