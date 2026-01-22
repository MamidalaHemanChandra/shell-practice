#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo -e "$R Error:: Take the Root Access $N"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ];then
        echo -e "$R Error: Installing $2 failure $N"
        exit 1
    else
        echo -e "$G Installing $2 Success $N"
    fi
}

dnf list installed mysql
#not installed then installed
if [ $? -ne 0 ];then
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "$Y Mysql already exists Skipping $N"
fi

dnf list installed redis
if [ $? -ne 0 ];then
    dnf install redis -y
    VALIDATE $? "redis"
else
    echo -e "$Y Redis already exists Skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ];then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx already exists Skipping $N"
fi