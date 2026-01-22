#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "Error:: Take the Root access"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];then
        echo "Error:: Installing $2 failure"
        exit 1
    else
        echo "Installing $2 Success"    
    fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install redis -y
VALIDATE $? "redis"

dnf install redis -y
VALIDATE $? "python3"
