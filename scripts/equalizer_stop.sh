#! /bin/bash

sleep 0.5

if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
then
   pactl set-default-sink $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
   pactl unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldsink.txt)
else
   :
fi
