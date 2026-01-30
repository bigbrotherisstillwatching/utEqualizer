#! /bin/bash

cp -a /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.9/service/utequalizer.service /home/phablet/.config/systemd/user
systemctl --user daemon-reload
systemctl --user enable utequalizer.service
