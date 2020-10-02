#!/bin/bash

bashf=$(ls -lAh | awk '{print $9}' | grep "^\.b")

for b in $bashf
do
  ln -s $(pwd)/$b ~/$b
done

ln -s $(pwd)/.vimrc ~/.vimrc

