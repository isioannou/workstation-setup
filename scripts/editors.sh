#!/usr/bin/env bash

set +e
source ./scripts/util.sh

printHeading "Installing editors"

#Installing vim by default
printStep "vim" "brew install vim"

editors=("$@")

for editor in "${!editors[@]}"
do
    case "${editors[$editor]}" in
        +)
            case $editor in
                0)
                    printStep "Visual Studio Code" "brew install --cask visual-studio-code"
                    ;;
                1)
                    printStep "Jetbrains Toolbox" "brew install --cask jetbrains-toolbox"
                    ;;
                2)
                    printStep "Pycharm" "brew install --cask pycharm"
                    ;;
                3)
                    printStep "Goland" "brew install --cask goland"
                    ;;
                4)
                    printStep "Webstorm" "brew install --cask webstorm"
                    ;;
                5)
                    printStep "Sublime Text" "brew install --cask sublime-text"
                    ;;
            esac
            ;;
    esac
done

set -e