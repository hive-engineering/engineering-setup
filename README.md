# Hive Engineering Setup 🚀

A modular setup script for Hive Engineering that automates the installation and configuration of essential development tools on macOS.

## Quick Start 🚀

1. Clone and run:
   ```bash
   git clone https://github.com/hive-engineering/engineering-setup.git
   cd engineering-setup
   chmod +x setup.sh
   ./setup.sh
   ```

2. For force reinstall of all tools:
   ```bash
   ./setup.sh --force
   ```

## Overview 📋

This script automates the setup of a new engineer's development environment by installing and configuring common tools and applications needed for development at Hive. It's designed to be:

- ✨ **Modular**: Each component is separated into its own script
- 🔄 **Idempotent**: Safe to run multiple times
- 🔧 **Configurable**: Supports different installation modes
- 🎯 **Focused**: Specifically designed for macOS + zsh environments

## What Gets Installed 📦

### Essential CLI Tools
- `awscli`: AWS Command Line Interface
- `yq`: YAML processor
- `terraform`: Infrastructure as Code tool
- `libpq`: PostgreSQL client
- `coreutils`: GNU core utilities
- `git`: Version control system

### Applications
- Docker Desktop
- AWS VPN Client
- TunnelBlick (VPN client for OpenVPN configurations)
- Visual Studio Code

### Optional Components
- Oh My Zsh (shell configuration)
- asdf (version manager)
- Hive repositories:
  - `fc-app`: Fulfilment centre facing app
  - `merchant-app`: Merchant facing app (Hive Portal)
  - `frontend-shared`: Shared components package
  - `post-purchase-app`: Post purchase focused app
  - `hivecore`: Backend serving the core feature of Hive

## Prerequisites 📝

- macOS operating system
- Terminal access
- Internet connection
- Administrator privileges

## Detailed Installation 💻

1. Clone this repository:
   ```bash
   git clone https://github.com/hive-engineering/engineering-setup.git
   cd engineering-setup
   ```

2. Make the script executable:
   ```bash
   chmod +x setup.sh
   ```

3. Run the script:
   ```bash
   ./setup.sh
   ```

## Usage Options 🛠

### Standard Installation
```bash
./setup.sh
```
This will:
- Install missing tools
- Skip already installed components
- Update existing tools if needed

### Force Installation
```bash
./setup.sh --force
```
This will:
- Reinstall all components even if already present
- Reconfigure all settings
- Update PATH and shell configurations

## Project Structure 📁

```
.
├── setup.sh                 # Main entry script
├── scripts/
│   ├── core/               # Core script functionality
│   │   ├── main.sh        # Main orchestrator
│   │   └── pre-checks.sh  # System validation
│   ├── installers/        # Installation scripts
│   │   ├── homebrew.sh    # Homebrew installation
│   │   ├── cli-tools.sh   # CLI tools installation
│   │   └── applications.sh # macOS apps installation
│   ├── optional/          # Optional components
│   │   ├── oh-my-zsh.sh   # Oh My Zsh setup
│   │   ├── asdf.sh        # asdf installation
│   │   └── repos.sh       # Repository cloning
│   └── utils/             # Utility scripts
│       ├── aws.sh         # AWS configuration
│       └── helpers.sh     # Helper functions
```

## After Installation ✅

After running the script:

1. Open a new terminal or run:
   ```bash
   exec zsh
   ```

2. Verify the installation by running:
   ```bash
   aws --version
   docker --version
   terraform --version
   git --version
   ```

3. If you installed Oh My Zsh, customize your `~/.zshrc`

4. If you installed asdf, check [asdf documentation](https://asdf-vm.com) for usage

5. For Hive repositories, check their respective README files for setup instructions

6. Configure your VPN by importing your OpenVPN configuration into TunnelBlick

## Troubleshooting 🔍

### Common Issues

1. **Homebrew Installation Fails**
   - Ensure you have internet connection
   - Check your system's security settings
   - Run `xcode-select --install` manually

2. **Permission Issues**
   - Ensure you have administrator privileges
   - Run `sudo chown -R $(whoami) /opt/homebrew` if Homebrew permissions are wrong

3. **Application Installation Fails**
   - Try installing the failed application manually via Homebrew
   - Check system requirements for each application

### Getting Help

If you encounter any issues:
1. Check the error message in the terminal
2. Verify your internet connection
3. Contact the engineering team for support

## Contributing 🤝

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License 📄

This project is proprietary and confidential to Hive Engineering.

## Support 💬

For support, please contact the engineering team or create an issue in the repository.
