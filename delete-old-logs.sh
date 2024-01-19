#!/bin/bash

APP-LOGS-DIR=/home/vijay/app.logs

DATE=$(date +%F:%H:%M:%S)
LOGDIR=/home/vijay/shellscript/shellscript.log
SCRIPT=$0
LOGFILE=$LOGDIR/$0-$DATE.log

FILES-TO-DELETE=$(find $APP-LOGS-DIR -name ".log -type f -mtime +1")

echo "script started executing at $DATE" &>>LOGFILE

while read line
do
    echo "Deleting $line" &>>LOGFILE
    rm -rf $line
done <<<$FILES-TO-DELETE