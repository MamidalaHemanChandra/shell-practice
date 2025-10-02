#!/bin/bash

num=$1

if [ $(($num % 2)) -eq 0 ]
then 
    echo "Even is $num"
else
    echo "Odd is $num"
fi