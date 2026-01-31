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

Source_dir=$1

if [ ! -d $Source_dir ];then
    echo "Error:: Source Dir $Source_dir doesn't exists"
    exit 1
fi

Log_files=$( find $Source_dir -name "*.log" -type f -mtime +14 )

while IFS= read -r file
do
    echo "Log files are: $file"
    rm -rf $file
    echo "Deleted log files are: $file "

done <<< $Log_files