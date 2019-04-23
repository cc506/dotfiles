#!/bin/bash

####################################################
# CREATION     : 2019-04-19
# MODIFICATION : 2019-04-19

# I3block's blocklet which:
# - Shows autorandr docked or mobile
# - Change to docked with left click
# - Change to mobile with right click

####################################################

case $BLOCK_BUTTON in
    1) autorandr --load docked;;     # left click
    3) autorandr --load mobile;;    # middle click
esac