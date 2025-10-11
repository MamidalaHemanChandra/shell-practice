#!/bin/bash
Threshold=2
IP=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
Subject="Disk Usage Alert"
Alert=""

Dish_Usage=$( df -hT | grep -v Filesystem )
while IFS= read -r line
do
    Used=$( echo "$line" | awk '{print $6}' | cut -d "%" -f1)
    Filesystem=$(echo "$line" | awk '{print $1}')
    if [ $Used -ge $Threshold ];then
        Alert+="Disk Usage $Used% on $Filesystem is more than $Threshold on $IP <br>"
    fi
done <<< $Dish_Usage

if [ -n "$Alert" ];then
    {
    echo "To: cryptochandra77@gmail.com"
    echo "Subject: $Subject"
    echo "Content-Type: text/html"
    echo ""
    echo "$Alert"
    } | msmtp "cryptochandra77@gmail.com"
fi
