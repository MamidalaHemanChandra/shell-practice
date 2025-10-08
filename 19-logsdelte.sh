#!/bin/bash

#0=Root, 1=normal user
USERID=$(id -u)

#colours
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#/var/log/script/log.log
FOLDER="/var/log/script"
SCRIPT=$( echo $0 | cut -d "." -f1)
FILE="$FOLDER/$SCRIPT.log"

mkdir -p $FOLDER
echo -e "$G Script Started at $(date)" | tee -a $FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R Take Root Access $N (Use Sudo)" 
    exit 1
fi

Souce_Dir="/home/ec-user/heman"

if [ ! -d $Souce_Dir ];then
    echo "Error :: $Souce_Dir doen't exist "
    exit 1
fi

Log_fileto_Delete=$(find $Souce_Dir -name "*.log" -type f -mtime +14)

while IFS= read -r line
do 
    echo "Found log files: $line "
    rm -rf $line
    echo "Deleted log file is : $line"

done < $Log_fileto_Delete
    
