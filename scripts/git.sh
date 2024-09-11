#!/usr/bin/env bash

source ./scripts/util.sh

printHeading "Installing Git"

brew install git

git config --global init.defaultBranch main