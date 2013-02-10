#!/bin/bash
. /data/Wing/bin/dataapps.sh
cd /data/TryIt/bin
export WING_CONFIG=/data/TryIt/etc/wing.conf
killall -HUP start_server
