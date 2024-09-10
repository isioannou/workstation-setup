#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing Terraform"
printDivider

brew tap hashicorp/tap
printStep "terraform" "brew install hashicorp/tap/terraform"

printStep "terraform shell completion" "terraform -install-autocomplete"
printStep "terraform tfenv" "brew install tfenv"

set -e
