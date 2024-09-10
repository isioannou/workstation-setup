#!/usr/bin/env bash

source ./scripts/util.sh

# Install Homebrew

if test ! $(which brew); then
  printHeading "Installing Homebrew..."
  yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if which brew; then
      echo "Homebrew install verified"
  else
      echo "Adding Homebrew to your PATH"
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "Ensuring you have the latest Homebrew"
brew update 

echo "Upgrading any already-installed formulae"
brew upgrade --all

printStep "Homebrew services" "brew tap homebrew/services"

printStep "Cask fonts" "brew tap homebrew/cask-fonts"

echo "Cleaning up your Homebrew installation..."
brew cleanup