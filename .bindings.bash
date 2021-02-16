#!/bin/bash

# Remove Ctrl-T Binding
bind -r '"\C-t"'

# Rebind to transposind characters
bind '"\C-t": transpose-chars'

# Bind Ctrl-i to fuzzy finder
bind -x '"\C-i": fzf-file-widget'

