#!/bin/bash
 
### BEGIN INIT INFO
# Provides:          start-aras-recorder.sh
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts aras-recorder
### END INIT INFO
 
aras-recorder /etc/aras/aras.conf 2>/var/log/aras/aras-recorder-error.log
