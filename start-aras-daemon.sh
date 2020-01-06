#!/bin/bash
 
### BEGIN INIT INFO
# Provides:          start-aras-daemon.sh
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts aras-daemon
### END INIT INFO
 
# To fix "* failed to open vchiq instance"
# sudo usermod -a -G video contrabanda
aras-daemon /etc/aras/aras.conf 2>/var/log/aras/error.log
