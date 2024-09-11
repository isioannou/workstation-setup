#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing Terraform"
printDivider

printStep "terraform tfenv" "brew install tfenv"
printStep "terraform 1.5.0" "tfenv install 1.5.0"

printf "Verify terraform installation"
terraform --version

printStep "terraform shell completion" "terraform -install-autocomplete"

set -e
