
#source /opt/Xilinx/14.7/ISE_DS/settings64.sh
alias strike='cd ~/Windows/CS/; ./run'

# Commands
alias pyserver='python3 -m http.server 9000'
alias p3='python3'
alias jfxCom='javac --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'
alias jfxRun='java --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'

# Directories
alias  ..='cd ..'
alias ...='cd ../..'
alias  .3='cd ../../..'
alias  .4='cd ../../../..'
alias  .5='cd ../../../../..'
alias htdocs='cd /var/www/html'
alias c='cd ~/Documents/C'
alias js='cd ~/Documents/JS'
alias docs='cd ~/Documents'
alias dow='cd ~/Downloads'
alias Go='cd ~/Documents/Go/src'

export CLASSPATH=$CLASSPATH:/usr/share/openjfx/lib
alias jfxCom='javac --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'
alias jfxRun='java --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'

alias sshpi3='ssh pi@$PI3_IP'
alias sshpi4='ssh pi@$PI4_IP'
alias bashrc='vim ~/.bashrc'
alias sl='echo "Steam Locomotive"'
alias get_idf='. ~/Documents/C/esp/esp-idf/export.sh'
alias tmux='tmux -2 -u'

alias vi='nvim'
alias vim='nvim'
alias ci='nvim'
alias cim='nvim'

alias gti='git'
alias gst='git status'
alias gl='git log'
alias gd='git diff'
alias gco='git checkout'
alias gr='cd $(git root)'

alias ardcli='arduino-cli'
alias code='codium'

alias ctc='xclip -selection clipboard'
alias fm='nautilus . 1>/dev/null 2>&1 &'

# some more ls aliases
if command -v exa
then
  alias ll='exa -l'
  alias la='exa -a'
  alias l='exa'
else
  alias ll='ls -l'
  alias la='ls -a'
  alias l='ls -CF'
fi

if command -v bat
  alias bat='bat --theme=gruvbox'
fi
