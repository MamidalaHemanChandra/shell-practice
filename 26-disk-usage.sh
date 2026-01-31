#!/bin/bash

Disk_Usage=$(df -hT | grep -v FileSystem)
IP_Address=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
Threshold=2
Message=""

while IFS=read -r line
do
    Usage=$(echo $line | awk '{print $6}'| cut -d "%" -f1)
    Parition=$(echo $line | awk '{print $7}' ) 
    if [ $Usage -ge $Threshold ];then 
        Message+="Hard Disk Usage is $Parition : $Usage % <br>"
    fi
done

echo -e "Message is: $Message"

sh mail.sh "cryptochandra77@gmail.com" "Hard Disk Usage Alert" "Hard Disk Usage" "$Message" "$IP_Address" "DevOps Team"

