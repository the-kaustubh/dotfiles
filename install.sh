#!/usr/bin/sh

rm ~/.bash*
rm ~/.vim*

bashf=$(ls -lAh | awk '{print $9}' | grep "^\.b")

for b in $bashf
do
  ln -s ./$i ~/$i
done

ln -s ./.vimrc ~/.vimrc

