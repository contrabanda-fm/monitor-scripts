#!/bin/bash
DIR="/home/contrabanda/continuidad/backup"
LOG="/var/log/audio_record_backup.sh.log"
FILENAME="contrabanda_%Y%m%d_%H%M.mp3"
# Duration in seconds of each generated file
DURATION="3600"
mkdir -p $DIR
cd $DIR
arecord -f CD | lame -r - | rotatelogs $FILENAME $DURATION >> $LOG 2>&1
