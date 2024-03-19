#! /bin/bash

sleep 0.5

if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
then
   pactl set-default-sink $(head -1 /home/phablet/.config/radio.s710/radio.s710.defaultsink.txt)
   pactl unload-module $(head -1 /home/phablet/.config/radio.s710/radio.s710.oldsink.txt)
else
   :
fi
