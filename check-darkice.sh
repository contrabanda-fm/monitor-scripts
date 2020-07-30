#!/bin/bash

PROCESS="darkice"
LOG="/var/log/darkice.log"
ERROR="Buffer overrun"
RESTART_LOG="/tmp/restart_darkice"
START_SCRIPT="/home/contrabanda/monitor-scripts/start-darkice.sh"
EMAIL_ADDRESS="user@example.com"
MESSAGE="Error '$ERROR' found.\nRestart of the service automatically tried"
SUBJECT="Alert: darkice KO"
 
restart_darkice () {
    killall $PROCESS
    $START_SCRIPT
    echo `date` - $1>>$RESTART_LOG 
    cp $LOG $LOG"."`date +"%d%m%Y_%H%M%S"`
    truncate -s 0 $LOG
    echo -e $MESSAGE | mail -s "$SUBJECT" $EMAIL_ADDRESS
}
 
if pidof $PROCESS>/dev/null
then
    if grep -c "$ERROR" $LOG>/dev/null
    then
        # Errors found in the logs
        restart_darkice "errors found in the logs"
    fi
else
    # Process not running
    restart_darkice "process not running"
fi
