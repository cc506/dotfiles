#!/bin/bash

dir=$HOME/Pictures/wallpapers
file=`/bin/ls -1 "$dir" | sort --random-sort | head -1`
pic=`readlink --canonicalize "$dir/$file"`
wal -i $pic
feh --bg-scale $pic
exec $HOME/.config/scripts/blurme.sh&
