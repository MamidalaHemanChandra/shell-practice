#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Source_Dir=$1
Destination_Dir=$2
Days=${3:-14}

Logs_Folder="/var/log/shell-script"
mkdir -p $Logs_Folder
Script_Name=$(echo $0 | cut -d "." -f1)
Logs="$Logs_Folder/backup.log"

USERID=$(id -u)
if [ $USERID -ne 0 ];then
    echo -e "$R Error:: Take the Root Access $N" | tee -a $Logs
    exit 1
fi



Usage() {
    echo "Error:: 24-backup.sh Source_Dir Destination_Dir Days [optioanl, default 14 days]"
    exit 1
}

if [ $# -lt 2 ];then
    Usage
fi

if [ ! -d  $Source_Dir ];then
    echo "Source Dir $Source_Dir doesn't exists"
    exit 1
fi

if [ ! -d  $Destination_Dir ];then
    echo "Source Dir $Destination_Dir doesn't exists"
    exit 1
fi

Log_files=$( find $Source_Dir -name "*.log" -type f -mtime +$Days )

if [ ! -z "$Log_files" ];then
    echo "Files found to Archieve: $Log_files"
    Timestamp=$(date +%F-%H-%M)
    Zip_file_name="$Destination_Dir/chandra:$Timestamp.zip"
    echo "ZIP file name is: $Zip_file_name"
    find $Source_Dir -name "*.log" -type f -mtime +$Days | zip -@ -j "$Zip_file_name"

    if [ -f $Zip_file_name ];then
        echo "Zip files found : $Zip_file_name"
        while IFS= read -r file
        do
            echo "Log files are: $file"
            rm -r $file
            echo "Deleted log files are: $file"

        done <<< $Zip_file_name

    else
        echo "Zip files not found"
    fi

else
    echo "Already done Archieve"
fi