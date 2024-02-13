#1/bin/bash

DATE=$(date +%F)
SCRIPT=$0
LOG=/tmp/$SCRIPT-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ....$R FAILURE $N"
        exit 1
    else
        echo -e "$2 ....$G SUCCES $N"
    fi
}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Run this script with root access"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y &>>$LOG

VALIDATE $? "Installing mysql"

yum install wget -y &>>$LOG

VALIDATE $? "Installing wget"

yum install zip -y &>>$LOG

VALIDATE $? "Installing zip"

yum install postfix -y &>>$LOG

VALIDATE $? "Installing Postfix"

yum install nginx -y &>>$LOG

VALIDATE $? "Installing nginx"

systemctl start nginx &>>$LOG
systemctl enable nginx &>>$LOG
systemctl status nginx &>>$LOG