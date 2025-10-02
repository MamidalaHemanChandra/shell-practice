#!/bin/bash

#check root user
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Take root access"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "MySql Installing error, failue"
    exit 1
else
    echo "MySql Installed, Success"
fi

