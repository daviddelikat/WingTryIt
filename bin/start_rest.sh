#!/bin/bash
. /data/Wing/bin/dataapps.sh
export WING_APP=/data/TryIt
export WING_CONFIG=/data/TryIt/etc/wing.conf
cd /data/TryIt/bin

if [ $UID == 0 ] 
  then
	echo "switching root to nobody"
	export RUNAS="--user nobody --group nobody"
fi

start_server --port 5000 -- starman --workers 2 --user nobody --group nobody --preload-app rest.psgi

