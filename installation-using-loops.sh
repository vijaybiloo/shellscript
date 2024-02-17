#!/bin/bash

DATE=$(date +%F)
SCRIPT=$0
LOGDIR=/home/centos/shellscript/shellscript.log
LOGFILE=$LOGDIR/$0-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo "You should be a root user to run this command"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ....$R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ....$G SUCCESS $N"
    fi

}

for i in $@
do

    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then
        echo "$i is not installed, lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else 
        echo -e "$Y $i is already installed $N"
    
    fi

done