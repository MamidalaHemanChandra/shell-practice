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


Source=$1
Destination=$2
Days=${3:-14}
Usage(){
    echo "Arg passed are Source:$Source Destination:$Destination Days:$Days [Deafult is 14,Opational]"
}

if [ $# -le 2 ];then
    Usage
fi

if [ ! $Source ];then
    echo "Source:$Source doesn't exist"
    exit 1
fi

if [ ! $Destination ];then
    echo "Destination:$Destination doesn't exist"
    exit 1
fi

Log_files=$(find $Source -name ".log" -type f -mtime +14)

if [ -z $Log_files ];then
    "Log files are empty"
    exit 1
else
    "Log files found : $Log_files"
    TimeStamp=$(date +%F,%H:%M:%s)
    Archieve=$Destination $TimeStamp.zip
    $Log_files | zip -@ -j $Archieve

    if [ ! $Archieve ];then
        echo "Archieve Files not created"
        exit 1
    else
        echo "$Archieve Files created"
    fi

    while IFS= read -r line
    do
        rm -rf 
    done << $Log_files

fi

