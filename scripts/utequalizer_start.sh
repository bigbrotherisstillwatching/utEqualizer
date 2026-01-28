#! /bin/bash

#default_sink=$(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:')

#sleep 0.5

#if [[ $(pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:') == equalizer ]]
#then
#   :
#else
pacmd list-sinks | grep -A1 '* index:' | sed 's/.*<//; s/>.*//' | grep -v '* index:' > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt
#rm -rf /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt
rm -rf /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.oldsink.txt
#systemctl --user stop utequalizer.service
#systemctl --user disable utequalizer.service
#rm -rf /home/phablet/.config/systemd/user/utequalizer.service
#systemctl --user daemon-reload
#pacmd unload-module $(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt)
pacmd load-module module-ladspa-sink sink_name=utequalizer sink_master=$(head -1 /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.defaultsink.txt) plugin=/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/lib/caps.so label=Eq10X2 control=$(sed -n '3p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '5p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '6p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '7p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '8p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '9p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '10p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '11p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '12p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//'),$(sed -n '4p' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf | sed 's/.*[=] *//')
pacmd list-modules | fgrep -B 2 /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/lib/caps.so | grep index | cut -c 12- > /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.utequalizermodule.txt
#pacmd set-default-sink equalizer
#exec /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/scripts/move_sink_inputs_to_utequalizer.sh
cp -a /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/service/utequalizer.service /home/phablet/.config/systemd/user
systemctl --user daemon-reload
systemctl --user enable --now utequalizer.service

#while true
#do
#   pactl list short sink-inputs | awk '{print $1}' | xargs -I {} pacmd move-sink-input {} utequalizer
#   sleep 1
#done
#fi
