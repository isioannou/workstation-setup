#!/usr/bin/env bash

source ./scripts/util.sh

# IDEs to make availabe. Please also adjust code to brew cask install
options[0]="Visual Studio Code";    devtoolchoices[0]="+"
options[1]="Jetbrains Toolbox";     devtoolchoices[1]=""
options[2]="Pycharm";               devtoolchoices[2]=""
options[3]="Goland";                devtoolchoices[3]=""
options[4]="Webstorm";              devtoolchoices[4]=""
options[5]="Sublime Text";          devtoolchoices[5]=""

while
    showIDEMenuLoop && \
    read -r -e -p "Enable or Disable by typing number. Hit ENTER to continue " -n1 SELECTION && [[ -n "$SELECTION" ]];
do
    if [[ "$SELECTION" == *[[:digit:]]* && $SELECTION -ge 1 && $SELECTION -le ${#options[@]} ]]; then
        (( SELECTION-- ))
        if [[ "${devtoolchoices[SELECTION]}" == "+" ]]; then
            devtoolchoices[SELECTION]=""
        else
            devtoolchoices[SELECTION]="+"
        fi
            ERROR=" "
    else
        ERROR="Invalid option: $SELECTION"
    fi
done

printDivider
printHeading "Starting Installations"
source ./scripts/homebrew.sh
source ./scripts/git.sh
source ./scripts/oh-my-zsh.sh
source ./scripts/unix.sh
source ./scripts/common-apps.sh
source ./scripts/editors.sh "${devtoolchoices[@]}"
source ./scripts/tools.sh

read -r -p "Do you want to install Terraform? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    source ./scripts/opt-in/terraform.sh
fi

read -r -p "Do you want to install AWS CLI? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    source ./scripts/opt-in/aws-cli.sh
fi

read -r -p "Do you want to install Python tools? [y/N]" response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    source ./scripts/opt-in/python-tools.sh
fi

printDivider
printHeading "Finished Installation"
printDivider
echo "Please restart your terminal to apply all changes"
printDivider
# End of file
