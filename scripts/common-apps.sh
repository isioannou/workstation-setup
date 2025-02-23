#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing common apps"

printStep "Install iterm2" "brew install --cask iterm2"
printStep "Install rectangle" "brew install --cask rectangle"
printStep "Install flycut" "brew install --cask flycut"

set -e