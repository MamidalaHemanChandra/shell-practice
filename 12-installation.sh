#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "Error:: Please take root access"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ];then
    echo "Error:: Installing  Mysql failure"
    exit 1
else
    echo "Installed Mysql Success"
fi
