#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing golang"
brew install golang

if command -v go &> /dev/null
then
    printStep "Golang installation verified" "go version"
else
    echo "Golang installation failed"
    exit 1
fi

set -e