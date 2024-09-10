#!/usr/bin/env bash

source ./scripts/util.sh

printHeading "Unix utilities"

printStep "coreutils" "brew install coreutils"
printStep "watch" "brew install watch"
printStep "wget" "brew install wget"
printStep "jq" "brew install jq"
printStep "yq" "brew install yq"
printStep "kubectl" "brew install kubectl"
printDivider
printf "\nVerify kubectl installation\n"
kubectl version --client