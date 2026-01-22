#!/bin/bash

num=$1

if [ $num -gt 7 ];then
    echo "Given $num is greater than 7"
    if [ $num -gt 10 ];then
        echo "Given $num is greater than 10"
    fi
else
    echo "Given $num is less than 7"
fi