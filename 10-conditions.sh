#!/bin/bash

num=$1

if [ $num -lt 10 ]
then
    echo "$num number is less than 10"
elif [ $num -eq 10 ]
then
    echo "$num number is equal to 10"
else
    echo "$num number is greater than 10"
fi