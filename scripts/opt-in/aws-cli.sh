#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing AWS CLI"

curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
rm AWSCLIV2.pkg

echo "verify installation"
aws --version

set -e
