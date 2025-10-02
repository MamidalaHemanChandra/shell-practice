#!/bin/bash

#check root user
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo "Take root access"
    exit 1
fi


validate(){
if [ $1 -ne 0 ]
then
    echo -e "$R $2 Installing error, failue $N"
    exit 1
else
    echo -e "$G $2 Installed, Success $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ] #0 1
then
    dnf install mysql -y
    validate $? "MySql"
else
    echo -e "$Y Already Installed skip $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    validate $? "Nginx"
else 
    echo -e "$Y Already Installed skip $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install python3 -y
    validate $? "Python3"
else
    echo -e "$Y Already Installed skip $N"
fi
