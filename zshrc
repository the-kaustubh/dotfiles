if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$PATH:/home/$USER/Documents/go/bin
export GOROOT="/home/$USER/Documents/go/"
export GOPATH="/home/$USER/Documents/Go/"
export GOBIN="/home/$USER/Documents/Go/bin"
export GO111MODULE="auto"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.sh_aliases ] && . ~/.sh_aliases
[ -f ~/.sh_functions ] && . ~/.sh_functions
[ -f ~/.sh_variables ] && . ~/.sh_variables

source /home/kaustubh/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/kaustubh/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
