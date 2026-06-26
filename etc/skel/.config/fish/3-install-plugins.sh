#!/bin/fish
#set -e

echo
tput setaf 3
echo "################################################################"
echo "################### Installing the plugins"
echo "################################################################"
tput sgr0
echo

echo "We assume you have installed these packages"
echo "sudo pacman -S fish kiro-shells"
echo
echo "We assume you are now on fish and have omf installed"
echo

omf install https://github.com/jhillyerd/plugin-git
omf install fzf
omf install colored-man-pages
omf install pj

fish_update_completions

echo
tput setaf 3
echo "################################################################"
echo "################### Plugins installed"
echo "################################################################"
tput sgr0
echo