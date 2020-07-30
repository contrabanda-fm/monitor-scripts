#!/bin/bash
PROCESS_NAME=$1
EMAIL_ADDRESS="user@example.com"
 
if ! pgrep -x $PROCESS_NAME>/dev/null 2>&1; then
  if [[ "aras-daemon" == $PROCESS_NAME ]]; then
    /home/user/scripts/start-aras-daemon.sh&
    MESSAGE="Error: $PROCESS_NAME process was not running. It was started"
  elif [[ "aras-recorder" == $PROCESS_NAME ]]; then
    MESSAGE="Error: $PROCESS_NAME process was not running. A manual start is required"
  fi
  SUBJECT=$MESSAGE
  echo -e $MESSAGE | mail -s "$SUBJECT" $EMAIL_ADDRESS
fi
