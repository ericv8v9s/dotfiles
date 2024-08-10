#alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

alias ffplay='ffplay -autoexit -hide_banner'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

#alias java8='/opt/java/jdk1.8.0_251/bin/java'
#alias javac8='/opt/java/jdk1.8.0_251/bin/javac -Xlint:all'
alias javac='javac -Xlint:all'

#alias kotlinc='kotlinc -jvm-target=18'

#alias cd='cd -P'
alias mv='mv -i'

alias gcc='gcc -pedantic -Wall -O3 -std=c17'
alias gccg='gcc -pedantic -Wall -Og -g -std=c17'
alias gcc-includes='gcc -E -v -'

alias gpp='g++ -pedantic -Wall -O3 -std=c++17'
alias gppg='g++ -pedantic -Wall -Og -g -std=c++17'


# visual
alias ll='ls -lFh --color=auto --time-style=long-iso'
alias la='ls -AlFh --color=auto  --time-style=long-iso'
alias l='ls -CF --color=auto --time-style=long-iso'

alias ip='ip -c=auto'


# misc
# no banner
alias gdb='gdb -q'
alias less='less -N -i'
alias murder='sudo killall -i'
#alias sxiv='sxiv -p -a -s f'
alias cal='LC_TIME=C cal'
alias bc='bc -lq'
alias du='du -bc'
alias diff='diff --color -w'
alias udiff='diff --color -wu'
alias date='date --iso-8601=seconds'
alias lsblk='lsblk -o NAME,TYPE,FSTYPE,FSSIZE,FSUSED,FSUSE%,MOUNTPOINT'
alias dup='xfce4-terminal --working-directory="$PWD"'
