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


echo -e "$G Script Started executed at : $(date) $N"  | tee -a $Logs

VALIDATE() {
    if [ $1 -ne 0 ];then
        echo -e "$R Installing $2 FAILURE $N" | tee -a $Logs
        exit 1
    else
        echo -e "$G Installing $2 SUCCESS $N" | tee -a $Logs
    fi
}

for package in $@
do
    dnf list installed $package &>>$Logs
    if [ $? -ne 0 ];then
        dnf install $package -y &>>$Logs
        VALIDATE $? "$package"
    else
        echo -e "$Y $package Already Installed ... SKIPPING $N" | tee -a $Logs
    fi
done