#!/bin/sh

fcitx5 -d

keynav daemonize

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xmisc

exec i3
