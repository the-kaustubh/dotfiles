#!/usr/bin/env bash

# Styling
bold="$(tput bold)"
normal="$(tput sgr0)"

# Colors
red="$(tput setaf 161)"
green="$(tput setaf 156)"
purple="$(tput setaf 127)"
blue="$(tput setaf 105)"
cyan="$(tput setaf 45)"

allfiles=$(git ls-files | sed '/ignore/d' | sed '/install/d' | sed '/styling/d' | sed '/README/d' )

for b in $allfiles
do
  if [[ -f ~/$b ]]
  then
    echo " Removing $bold$b$normal ..."
    rm -f ~/$b
    echo " Removed $bold$b$normal"
  fi
  echo "Creating symlink to $bold$(pwd)/$b$normal"
  echo ""
  ln -s $(pwd)/$b ~/$b
done

echo ""
echo "$green$bold Installed dotfiles$normal"
echo "Need to install following dependencies: exa fd bat zoxide"
