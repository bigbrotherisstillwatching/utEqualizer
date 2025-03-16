#! /bin/bash

sleep 0.5

if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
then
   pacmd set-default-sink $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
   pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldsink.txt)
else
   :
fi
