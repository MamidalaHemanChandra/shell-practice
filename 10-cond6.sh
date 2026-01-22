#!/bin/bash

num=$1
if ! [ $num -ge 7 ];then
    echo "Given $num is less than 7"
else
    echo "Given $num is greater than 7"
fi