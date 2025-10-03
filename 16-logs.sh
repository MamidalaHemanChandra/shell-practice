#!/bin/bash

#check root user
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m"

LOGS_FOLIDER="/var/log/shell-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLIDER/$SCRIPT_NAME.log" #/var/log/shell-practice/16-logs.log

mkdir -p $LOGS_FOLIDER 

echo "Script Started time :  $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]
then 
    echo "Take root access"
    exit 1
fi



validate(){
if [ $1 -ne 0 ]
then
    echo -e "$R $2 Installing error, failue $N" | tee -a $LOGS_FILE
    exit 1
else
    echo -e "$G $2 Installed, Success $N" | tee -a $LOGS_FILE
fi
}

dnf list installed mysql &>>$LOGS_FILE
if [ $? -ne 0 ] #0 1
then
    dnf install mysql -y &>>$LOGS_FILE
    validate $? "MySql"
else
    echo -e "$Y Already Installed skip $N" | tee -a $LOGS_FILE
fi

dnf list installed nginx &>>$LOGS_FILE
if [ $? -ne 0 ]
then 
    dnf install nginx -y &>>$LOGS_FILE
    validate $? "Nginx"
else 
    echo -e "$Y Already Installed skip $N" | tee -a $LOGS_FILE
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $? -ne 0 ]
then
    dnf install python3 -y &>>$LOGS_FILE
    validate $? "Python3"
else
    echo -e "$Y Already Installed skip $N" | tee -a $LOGS_FILE
fi