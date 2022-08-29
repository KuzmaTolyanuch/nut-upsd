#!/bin/sh

nutCfgVolume="/etc/nut"
nutCfgFiles="ups.conf upsd.conf upsd.users"

echo "*** NUT upsd startup ***"

# bail out if the config volume is not mounted
grep ${nutCfgVolume} /proc/mounts >/dev/null ||
	{ printf "ERROR: It does not look like the config volume is mounted to %s. Have a look at the README for instructions.\n" ${nutCfgVolume}; exit; }

# initialize UPS driver
printf "Starting up the UPS drivers ...\n"
/usr/sbin/upsdrvctl start || { printf "ERROR on driver startup.\n"; exit; }

# run the ups daemon
printf "Starting up the UPS daemon ...\n"
exec /usr/sbin/upsd -D $* || { printf "ERROR on daemon startup.\n"; exit; }
