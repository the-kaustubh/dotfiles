#!/usr/bin/env bash

read rootFolder

rootFolder=$(echo $rootFolder | sed -e "s/~/\/home\/$USER/")
echo $rootFolder

projectName=$(echo $rootFolder | tr / "\n" | tail -n 1)
echo $projectName

cd $rootFolder
hasClient=$(ls -1 | grep -i 'client' | wc -l)
hasServer=$(ls -1 | grep -i 'server' | wc -l)

tmux new-session -d -s "$projectName"
tmux send-keys -t "$projectName" "cd $rootFolder" C-m

if [ $hasClient -gt 0 ]
then
  tmux send-keys -t "$projectName:" 'cd client; npm run serve' C-m
  tmux neww -t "$projectName:" -n "client"
  tmux send-keys -t "$projectName:1" "cd $rootFolder" C-m 'cd client' C-m C-l
fi

if [ $hasServer -gt 0 ]
then
  tmux split-pane -v -t "$projectName:0" 'cd server; npm run serve'
  tmux neww -t "$projectName:" -n "server"
  tmux send-keys -t "$projectName:2" "cd $rootFolder" C-m 'cd server' C-m C-l
  # tmux send-keys -t "$projectName:0.1" 'npm run serve'
fi

cd
