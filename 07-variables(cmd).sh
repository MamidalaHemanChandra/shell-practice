#!/bin/bash

Date=$(date)
echo "Timestamp is: $Date"

Start_Time=$(date +%s)
sleep 10
End_Time=$(date +%s)
Total_Time=$(($End_Time - $Start_Time))
echo "Script exected in : $Total_Time sec"
