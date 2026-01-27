#!/bin/bash

Source_Dir=$1
Destination_Dir=$2
Days=${3:-14}

Usage() {
    echo "Error:: 24-backup.sh Source_Dir Destination_Dir Days [optioanl, default 14 days]"
    exit 1
}

if [ $# -lt 2 ];then
    Usage
fi

if [ ! -d  $Source_Dir ];then
    echo "Source Dir $Source_Dir doesn't exists"
fi

if [ ! -d  $Destination_Dir ];then
    echo "Source Dir $Destination_Dir doesn't exists"
fi

Log_files=$( find $Source_Dir -name "*.log" -type f -mtime $Days )

if [ ! -z $Log_files ];then
    echo "Files found to Archieve: $Log_files"
    Timestamp=$(date +%F-%H-%M)
    Zip_file_name="$Destination_Dir/app-logs:$Timestamp"
    echo "ZIP file name is: $Zip_file_name"
    find $Source_Dir -name "*.log" -type f -mtime $Days | zip @ -j $Zip_file_name

    if [ -f $Zip_file_name ];then
        echo "Zip files found : $Zip_file_name"
        while IFS=read -r file
        do
            echo "Log files are: $file"
            rm -rf $file
            echo "Deleted log files are: $file"

        done <<< $Source_Dir

    else
        echo "Zip files not found"
    fi

else
    echo "No files found to Archieve"
fi