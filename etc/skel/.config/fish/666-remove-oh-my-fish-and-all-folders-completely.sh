#!/bin/fish
#set -e

# from script 2

omf remove gitstatus
omf remove lambda

# from script 3

omf remove git
omf remove fzf
omf remove colored-man-pages
omf remove pj

# from script 4

omf remove tide

# remove omf
curl -L http://get.oh-my.fish > install
fish install --uninstall --yes
rm ~/.config/fish/install

rm -rf ~/.config/omf
rm -rf ~/.local/share/omf
rm -rf ~/.cache/omf

echo
tput setaf 3
echo "################################################################"
echo "################### Oh my fish removed"
echo "################### Remove the fish_variables file if need be"
echo "################################################################"
tput sgr0
echo
