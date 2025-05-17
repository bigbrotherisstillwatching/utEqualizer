#! /bin/bash

sleep 0.5

if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
then
   pacmd set-default-sink $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
   pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldsink.txt)
   pacmd load-module module-ladspa-sink sink_name=equalizer sink_master=$(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt) plugin=/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.6/lib/caps.so label=Eq10X2 control=$(sed -n '3p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '5p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '6p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '7p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '8p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '9p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '10p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '11p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '12p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '4p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//')
   pacmd list-modules | fgrep -B 2 /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.6/lib/caps.so | grep index | cut -c 12- > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldsink.txt
   pacmd set-default-sink equalizer
else
   :
fi
