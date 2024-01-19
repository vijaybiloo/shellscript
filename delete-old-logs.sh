#!/bin/bash

APP_LOGS_DIR=/home/vijay/app.logs

DATE=$(date +%F:%H:%M:%S)
LOGDIR=/home/vijay/shellscript/shellscript.log
SCRIPT=$0
LOGFILE=$LOGDIR/$SCRIPT-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name ".log -type f -mtime +1")

echo "script started executing at $DATE" &>>LOGFILE

while read line
do
    echo "Deleting $line" &>>LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE