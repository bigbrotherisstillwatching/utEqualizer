#! /bin/bash

systemctl --user stop utequalizer.service
rm -f /home/phablet/.config/systemd/user/utequalizer.service
systemctl --user daemon-reload
