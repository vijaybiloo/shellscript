#!/bin/bash

# colours
# Validations
# Log redirections

LOGFILE_DIR= /tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT=$0
LOGFILE=$LOGFILE_DIR/$SCRIPT-$DATE.log

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
    DISK_USAGE | awk '{print $6}' | cut -d % -f1