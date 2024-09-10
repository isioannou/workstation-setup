#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing Py env"
brew install pyenv pyenv-virtualenv

cat <<EOF >> ~/.zshrc
# Pyenv
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
EOF

printStep "Install Python 3.11" "pyenv install 3.11.0"

set -e