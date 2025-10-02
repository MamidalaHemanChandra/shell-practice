#!/bin/bash

#check root user
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Take root access"
    exit 1
fi


validate(){
if [ $1 -ne 0 ]
then
    echo "$2 Installing error, failue"
    exit 1
else
    echo "$2 Installed, Success"
fi
}

dnf install mysql -y
validate $? "MySql"

dnf install nginx -y
validate $? "Nginx"

dnf install python3 -y
validate $? "Python3"