#! /bin/bash

sleep 0.5

systemctl --user stop utequalizer.service
pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt)
pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt)
