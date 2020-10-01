#!/usr/bin/sh

bashf=$(ls -lAh | awk '{print $9}' | grep "^\.b")

for b in $bashf
do
  ln -s ./$b ~/$b
done

ln -s ./.vimrc ~/.vimrc

