#!/bin/sh
# https://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html
THRESHOLD=95
EMAIL_ADDRESS="tecnica@contrabanda.org"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $THRESHOLD ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep%" "$EMAIL_ADDRESS"
  fi
done
