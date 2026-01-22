#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_Folder="/var/log/shell-script"
mkdir -p $Logs_Folder
Script_Name=$(echo $0 | cut -d "." -f1)
Logs="$Logs_Folder/$Script_Name.log"

USERID=$(id -u)
if [ $USERID -ne 0 ];then
    echo -e "$R Error:: Take the Root Access $N" | tee -a $Logs
    exit 1
fi


echo -e "$G Script Started executed at : $(date)" $N | tee -a $Logs

VALIDATE() {
    if [ $1 -ne 0 ];then
        echo -e "$R Error: Installing $2 failure $N" | tee -a $Logs
        exit 1
    else
        echo -e "$G Installing $2 Success $N" | tee -a $Logs
    fi
}

dnf list installed mysql  &>>$Logs
#not installed then installed
if [ $? -ne 0 ];then
    dnf install mysql -y &>>$Logs
    VALIDATE $? "mysql"
else
    echo -e "$Y Mysql already exists Skipping $N" | tee -a $Logs
fi

dnf list installed redis &>>$Logs
if [ $? -ne 0 ];then
    dnf install redis -y &>>$Logs
    VALIDATE $? "redis"
else
    echo -e "$Y Redis already exists Skipping $N" | tee -a $Logs
fi

dnf list installed nginx &>>$Logs
if [ $? -ne 0 ];then
    dnf install nginx -y &>>$Logs
    VALIDATE $? "nginx"
else
    echo -e "$Y Nginx already exists Skipping $N" | tee -a $Logs
fi