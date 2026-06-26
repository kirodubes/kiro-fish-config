#!/bin/bash
#set -e

echo
tput setaf 3
echo "################################################################"
echo "################### Installing oh my fish"
echo "################################################################"
tput sgr0
echo

echo "We assume you have installed these packages"
echo "sudo pacman -S fish kiro-shells"
echo
echo "Now change to fish with our alias - type it in a terminal"
echo
echo "tofish"
echo
[ -d $HOME"/.local/share/omf-backup" ] && rm -rf $HOME"/.local/share/omf-backup"
[ -d $HOME"/.local/share/omf" ] && mv -f $HOME"/.local/share/omf" $HOME"/.local/share/omf-backup"

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo
tput setaf 3
echo "################################################################"
echo "################### Oh my fish installed"
echo "################################################################"
tput sgr0
echo
