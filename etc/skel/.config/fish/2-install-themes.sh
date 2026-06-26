#!/bin/fish
#set -e

echo
tput setaf 3
echo "################################################################"
echo "################### Installing the themes"
echo "################################################################"
tput sgr0
echo

echo "We assume you have installed these packages"
echo "sudo pacman -S fish kiro-shells"
echo
echo "We assume you are now on fish and have omf installed"
echo

omf install lambda
omf install bobthefish

echo
tput setaf 3
echo "################################################################"
echo "################### Themes installed"
echo "################################################################"
tput sgr0
echo