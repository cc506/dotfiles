#!/bin/sh

case "$1" in
    logout)
        i3-msg exit
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {logout|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0