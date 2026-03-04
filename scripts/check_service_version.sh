#! /bin/bash

file=/home/phablet/.config/systemd/user/utequalizer.service
version=1.0.9
new_version=1.1.0

if grep -q $version $file
then
	sed -i "s/$version/$new_version/g" $file
	systemctl --user daemon-reload
else
	:
fi
