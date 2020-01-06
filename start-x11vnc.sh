#!/bin/bash
 
### BEGIN INIT INFO
# Provides:          start-x11vnc.sh
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Starts x11vnc
### END INIT INFO
 
x11vnc -forever -display :0 -rfbauth /home/contrabanda/.vnc/passwd
