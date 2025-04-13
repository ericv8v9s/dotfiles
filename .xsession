#!/bin/sh

# display and other X related settings
. "$HOME"/.local/bin/xmisc

fcitx5 -d

kaynav daemonize

exec i3
