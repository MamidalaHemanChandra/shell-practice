#!/bin/bash

echo "Pass All the variables : $@"
echo "Pass All the variables : $*"
echo "script name : $0"
echo "current directory: $PWD"
echo "User is : $USER" 
echo "Home : $HOME"
echo "PID is : $$"
sleep 10 &
echo "sleep time is : $!"