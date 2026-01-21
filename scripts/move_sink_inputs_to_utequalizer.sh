#! /bin/bash

while true
do
   pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} utequalizer
   sleep 1
done
