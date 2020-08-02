#!/bin/sh

cpuTemp=`cat /sys/class/thermal/thermal_zone0/temp`
cpuTemp="$((cpuTemp / 1000)).${cpuTemp:2:1} °C"

gpuTemp=`vcgencmd measure_temp`

if [[ gpuTemp ]]; then
    gpuTemp=ERR
else
    gpuTemp=${gpuTemp:5:4} °C
fi

echo {\"cpu\": \"$cpuTemp\", \"gpu\": \"$gpuTemp\"}
