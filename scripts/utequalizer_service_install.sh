#! /bin/bash

cp -a /opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.1.0/service/utequalizer.service /home/phablet/.config/systemd/user
systemctl --user daemon-reload
systemctl --user enable utequalizer.service
