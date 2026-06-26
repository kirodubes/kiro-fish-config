#!/bin/fish
#set -e

echo
tput setaf 3
echo "################################################################"
echo "################### Installing the tide plugin"
echo "################### Conflicts with other themes"
echo "################################################################"
tput sgr0
echo

echo "We assume you have installed these packages"
echo "sudo pacman -S fish kiro-shells"
echo

sudo pacman -S --noconfirm fisher
fisher install IlanCosman/tide@v6

echo
tput setaf 3
echo "################################################################"
echo "################### Plugin installed"
echo
echo "################### Now you can configure the tide plugin"
echo
echo "################### Type in a terminal:"
echo "################### reload"
echo "################### tide configure"
echo "################################################################"
tput sgr0
echo