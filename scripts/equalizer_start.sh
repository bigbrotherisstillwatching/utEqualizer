#! /bin/bash

sleep 0.5

if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
then
   :
else
   pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:' > /home/phablet/.config/radio.s710/radio.s710.defaultsink.txt
   pactl unload-module $(head -1 /home/phablet/.config/radio.s710/radio.s710.oldsink.txt)
   pactl load-module module-ladspa-sink sink_name=equalizer sink_master=$(head -1 /home/phablet/.config/radio.s710/radio.s710.defaultsink.txt) plugin=/opt/click.ubuntu.com/radio.s710/1.4.7/lib/caps.so label=Eq10X2 control=$(sed -n '3p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '5p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '6p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '7p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '8p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '9p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '10p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '11p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '12p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//'),$(sed -n '4p' /home/phablet/.config/radio.s710/radio.s710.conf | sed 's/.*[=] *//') > /home/phablet/.config/radio.s710/radio.s710.oldsink.txt
   pactl set-default-sink equalizer
fi
