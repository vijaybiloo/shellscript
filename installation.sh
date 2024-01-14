#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Run this script with toot access"
    exit 1
else
    echo "You are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Error in Insatallation of mysql"
    exit 1
else
    echo "Installation of mysql is Sucess"
fi

yum install wget -y

if [ $? -ne 0 ]
then
    echo "Error in Istallation of wget"
    exit 1
else
    echo "Installation of wget is Sucess"
fi

yum install zip -y

if [ $? -ne 0 ]
then
    echo "Error in Istallation of zip"
    exit 1
else
    echo "Installation of zip is Sucess"
fi

yum install postfix -y

if [ $? -ne 0 ]
then
    echo "Error in Istallation of postfix"
    exit 1
else
    echo "Installation of postfix is Sucess"
fi