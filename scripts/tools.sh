#!usr/bin/env bash

set +e

source ./scripts/util.sh

printHeading "Installing common tools"

if [[ -d "/Applications/Postman.app" ]]; then
    printDivider
    echo "✔ Postman already installed. Skipping"
else
    printStep "Postman" "brew install --cask postman"
fi

if [[ -d "/Applications/OpenLens.app" ]]; then
    printDivider
    echo "✔ OpenLens already installed. Skipping"
else
    printStep "OpenLens" "brew install --cask openlens"
fi

if [[ -d "/Applications/Firefox.app" ]]; then
    printDivider
    echo "✔ Firefox already installed. Skipping"
else
    printStep "Firefox" "brew install --cask firefox"
fi

set -e