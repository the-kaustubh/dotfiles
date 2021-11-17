#!/bin/bash

# Remove Ctrl-T Binding
bind -r '"\C-t"'

# Rebind to transposind characters
bind '"\C-t": transpose-chars'

# Bind Ctrl-g to fuzzy finder
function fuzzify() {
  if ! command -v bat
  then
    fzf --preview
  else
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
  fi
}

bind -x '"\C-g": fuzzify'
