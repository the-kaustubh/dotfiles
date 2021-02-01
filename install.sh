#!/bin/bash

# bash related files
bashf=$(ls -lAh | awk '{print $9}' | grep "^\.b")

for b in $bashf
do
  ln -s $(pwd)/$b ~/$b
done

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.gitconfig ~/.gitconfig
