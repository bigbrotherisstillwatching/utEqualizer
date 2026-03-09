#! /bin/bash

#systemctl --user disable utequalizer.service
systemctl --user stop utequalizer.service
rm -f /home/phablet/.config/systemd/user/utequalizer.service
systemctl --user daemon-reload
