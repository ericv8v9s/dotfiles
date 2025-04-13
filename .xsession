#!/bin/sh

fcitx5 -d

keynav daemonize

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xmisc

xss-lock xsecurelock &

exec i3
