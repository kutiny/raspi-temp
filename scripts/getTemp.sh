#!/bin/sh

cpuTemp=`cat /sys/class/thermal/thermal_zone0/temp`
cpuTemp2=`echo $cpuTemp | cut -c3-4`
cpuTemp="$((cpuTemp / 1000)).${cpuTemp2} °C"

# gpuTemp=`vcgencmd measure_temp`

# if [ $gpuTemp = "" ]; then
#     gpuTemp=ERR
# else
#     gpuTemp="`echo $gpuTemp | cut -c6-9` °C"
# fi

# echo {\"cpu\": \"$cpuTemp\", \"gpu\": \"$gpuTemp\"}
echo {\"cpu\": \"$cpuTemp\"}
