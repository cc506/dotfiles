#!/bin/sh

# INSTANCE="${BLOCK_INSTANCE:-""}"
# ALERT_LOW="${2:-10}"

if test -e "/sys/class/power_supply/BAT0"
then
    status=$(cat /sys/class/power_supply/BAT0/status)
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    case "$status" in
        "Discharging")
            symbol=''
			#remaining="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "time" | cut -d ' ' -f 14-15)"
			remaining="$(acpi)"
            ;;
        "Charging")
            symbol='⚡'
			#remaining="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "time" | cut -d ' ' -f 15-16)"
			remaining="$(acpi)"
            ;;
        "Full")
            exit
            ;;
    esac
	if [ $capacity -gt 89 ]
	then
		baticon=''
	else
		if [ $capacity -gt 62 ]
		then
		baticon=''
		else
			if [ $capacity -gt 35 ]
			then
				baticon=''
			else
				if [ $capacity -gt 10 ]
				then
					baticon=''
				else
					baticon=''
				fi
			fi
		fi
	fi

    # Full text
	echo "$baticon $capacity% $remaining"
    # Short text
    #echo "Ψ $capacity% $symbol"

    # Color
    #if test $capacity -le $ALERT_LOW -a $status = "Discharging"
    #then
        #echo "#F5A3A3"
    #fi
	#if [ $status = "Charging" ]
	#then
		#echo "#70CBB6"
	#fi
fi
