#!/bin/bash

# count=5

# while [ $count -gt 0 ];
# do
#     echo "Time left: $count"
#     sleep 1
#     count=$(($count -1))

# done

while IFS=read -r file
do
    echo "Lines in a file: $file"

done < 20-script-1.sh