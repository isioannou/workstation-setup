#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing oh my zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

sed -i '' 's/ZSH_THEME.*/ZSH_THEME=apple/g' ~/.zshrc

echo "Installing Nerd font"
brew install font-hack-nerd-font

echo "Download auto suggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste up-line-or-search down-line-or-search expand-or-complete accept-line push-line-or-edit)" >> ~/.zshrc

echo "Download syntax highlight"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i '' -e "s/plugins=/plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker kubectl aws)/g" ~/.zshrc

cat << EOT >> ~/.zshrc
docker() {
  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "\$1" --platform linux/amd64 "\${@:2}"
  else
     /usr/local/bin/docker "\$@"
  fi
}
EOT
 
set -e