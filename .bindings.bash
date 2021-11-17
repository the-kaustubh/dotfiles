#!/bin/bash

# Remove Ctrl-T Binding
bind -r '"\C-t"'

# Rebind to transposind characters
bind '"\C-t": transpose-chars'

# Bind Ctrl-g to fuzzy finder
function fuzzify() {
  fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
}

bind -x '"\C-g": fuzzify'
