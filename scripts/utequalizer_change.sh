#! /bin/bash

sleep 0.5

#if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
#then
#pacmd set-default-sink $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
kill $(pgrep -f utequalizer_start.sh)
#pgrep -f utequalizer_change.sh > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldutequalizerchangescript.txt
#kill $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldutequalizerchangescript.txt)
kill $(pgrep -f move_sink_inputs_to_utequalizer.sh)
pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt)
pacmd load-module module-ladspa-sink sink_name=utequalizer sink_master=$(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt) plugin=/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/lib/caps.so label=Eq10X2 control=$(sed -n '3p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '5p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '6p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '7p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '8p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '9p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '10p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '11p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '12p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '4p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//')
pacmd list-modules | fgrep -B 2 /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/lib/caps.so | grep index | cut -c 12- > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt
#pacmd set-default-sink equalizer
#pgrep -f utequalizer_change.sh > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldutequalizerchangescript.txt
exec /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/scripts/move_sink_inputs_to_equalizer.sh

#while true
#do
#   pgrep -f utequalizer_change.sh > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldutequalizerchangescript.txt
#   pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} utequalizer
#   sleep 1
#done

#else
#   :
#fi
