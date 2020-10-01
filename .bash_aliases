
#source /opt/Xilinx/14.7/ISE_DS/settings64.sh
alias strike='cd ~/Windows/CS/; ./run'
LS_COLORS="ow=01;94:di=01;94";
export LS_COLORS

alias htdocs='cd /var/www/html'
alias jfxCom='javac --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'
alias jfxRun='java --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'
alias pyserver='python3 -m http.server 9000'
alias p3='python3'

alias  ..='cd ..'
alias ...='cd ../..'
alias  .3='cd ../../..'
alias  .4='cd ../../../..'
alias  .5='cd ../../../../..'alias htdocs='cd /var/www/html'

#alias topcommands='history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head'
#source /opt/Xilinx/14.7/ISE_DS/settings64.sh
#alias logtime='while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done'

alias htdocs='cd /var/www/html'
export CLASSPATH=$CLASSPATH:/usr/share/openjfx/lib
alias jfxCom='javac --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'
alias jfxRun='java --module-path /usr/share/openjfx/lib --add-modules=javafx.base,javafx.controls,javafx.fxml,javafx.graphics,javafx.media,javafx.swing,javafx.web'

alias pyserver='python3 -m http.server 9000'
alias p3='python3'

PATH=$PATH:/home/kaustubh/Documents/Application/energia-1.8.10E23
PATH=$PATH:/home/kaustubh/.arduino15/packages/arduino/tools/arm-none-eabi-gcc/4.8.3-2014q1/bin
PATH=$PATH:/home/kaustubh/.arduino15/packages/esp8266/tools/xtensa-lx106-elf-gcc/2.5.0-4-b40a506/bin
PATH=$PATH:/home/kaustubh/Documents/Application/blender-2.82a-linux64/
PATH=$PATH:/home/kaustubh/Documents/Application/flutter/bin/
ANDROID_SDK_ROOT=/home/kaustubh/Android/Sdk

PI3_IP='192.168.43.146'
PI3_ADDR="http://$PI3_IP"
alias sshpi3='ssh pi@$PI3_IP'

PI4_IP='192.168.43.41'
PI4_ADDR="http://$PI4_IP"
alias sshpi4='ssh pi@$PI4_IP'

export EDITOR=vim

alias c='cd ~/Documents/C'
alias js='cd ~/Documents/JS'

alias docs='cd ~/Documents'
alias dow='cd ~/Downloads'
alias bashrc='vim ~/.bashrc'
alias rm='rm -i'
alias mv='mv -i'

