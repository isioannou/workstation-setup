# Workstation Setup

This repository contains scripts and configurations for setting up a development workstation.

## Functionality

The scripts in this repository automate the installation and configuration of various tools and applications commonly used by developers.

## Usage

To set up your workstation, run the `setup.sh` script. This script will install and configure the necessary tools and applications.

```bash
./setup.sh
```

## Scripts

*   `setup.sh`: Main script to install and configure the workstation.
*   `scripts/`: Contains various scripts for installing and configuring specific tools and applications.
    *   `scripts/common-apps.sh`: Installs common applications like Google Chrome, Visual Studio Code, etc.
    *   `scripts/editors.sh`: Installs and configures text editors like Visual Studio Code.
    *   `scripts/git.sh`: Installs and configures Git.
    *   `scripts/homebrew.sh`: Installs Homebrew package manager.
    *   `scripts/oh-my-zsh.sh`: Installs and configures Oh My Zsh.
    *   `scripts/tools.sh`: Installs command-line tools like `wget`, `curl`, etc.
    *   `scripts/unix.sh`: Configures Unix environment.
    *   `scripts/util.sh`: Utility functions used by other scripts.
    *   `scripts/opt-in/`: Contains scripts for installing optional tools.
        *   `scripts/opt-in/aws-cli.sh`: Installs AWS CLI.
        *   `scripts/opt-in/golang.sh`: Installs Go.
        *   `scripts/opt-in/python.sh`: Installs Python.
        *   `scripts/opt-in/terraform.sh`: Installs Terraform.
