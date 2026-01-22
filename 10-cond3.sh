#!/bin/bash

num=$1  

if [ $num -gt 10 ];then
    echo "Given $num is greater than 10"
elif [ $num -gt 12 ];then
    echo "Given $num is greater than 12"
else
    echo "Given $num is less than 10"
fi