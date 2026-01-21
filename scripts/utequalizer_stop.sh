#! /bin/bash

var1=$(pgrep -f utequalizer_start.sh)
var2=$(pgrep -f move_sink_inputs_to_utequalizer.sh)

sleep 0.5

#if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
#then
#kill $(pgrep -f utequalizer_start.sh)
#kill $(pgrep -f move_sink_inputs_to_utequalizer.sh)
if ! [ "x$var1" = "x"  ]; then
    kill "$var1"
fi
if ! [ "x$var2" = "x"  ]; then
    kill "$var2"
fi
#pacmd set-default-sink $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt)
#else
#   :
#fi
