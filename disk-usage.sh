#!/bin/bash

# colours
# Validations
# Log redirections

LOGDIR=/tmp/log.dir
DATE=$(date +%F:%H:%M:%S)
SCRIPT=$0
LOGFILE=$LOGDIR/$SCRIPT-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem|vfat')
DISK_USAGE_THRESHOLD=1
message=""

#IFS= means internal feild seperator is space.
while IFS= read line
do
    # this command will give you usage in number format for comparision
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    # this command will give us partition
    partition=$(echo $line | awk '{print $1}')
    #now you need to check whether it is more than threshold or not

    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then
        message+="HIGH DISK USAGE on $partition: $usage\n"
    fi

    echo -e "message: $message"

    #echo "$message" | mail -s "High Disk usage" dpk.vijay@gmail.com

    #how to call other shell script from your current script
    sh mail.sh dpk.vijay@gmail.com "High Disk Usage" "$message" "DEVOPS TEAM" "High Disk usage"


    