#!/bin/sh
cpuTemp=`cat /sys/class/thermal/thermal_zone0/temp`
cpuTemp2=`echo $cpuTemp | cut -c3-4`
cpuTemp="$((cpuTemp / 1000)).${cpuTemp2} °C"
echo {\"cpu\": \"$cpuTemp\"}
