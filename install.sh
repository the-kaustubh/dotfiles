#!/bin/bash

# bash related files
allfiles=$(git ls-files | sed '/ignore/d' | sed '/install/d')

for b in $allfiles
do
  echo "Removing $b ..."
  rm -f ~/$b 
  echo "Removed $b"
  echo "Creating symlink to $(pwd)/$b"
  ln -s $(pwd)/$b ~/$b
done

echo "Installed dotfiles"
