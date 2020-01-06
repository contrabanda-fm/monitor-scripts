#!/bin/bash
ERROR_MESSAGE="xcb_connection_has_error() returned true"
LOG_FILE=/var/log/aras/error.log
EMAIL_ADDRESS="tecnica@example.com"
MESSAGE="Error '$ERROR_MESSAGE' found.\nKindly connect to Franky and stop/start aras-daemon"
SUBJECT="Alert: aras KO due to Cannot allocate memory"
 
if grep --quiet "$ERROR_MESSAGE" "$LOG_FILE"; then
  echo -e $MESSAGE | mail -s "$SUBJECT" $EMAIL_ADDRESS
  cp $LOG_FILE $LOG_FILE"."`date +"%d%m%Y_%H%M%S"`
  truncate -s 0 $LOG_FILE
fi
