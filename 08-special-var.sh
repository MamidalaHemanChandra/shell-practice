#!/bin/bash

echo "All variables passed to the Script: $@"
echo "All variables passed to the Script: $*"
echo "Script name is: $0"
echo "Current directory is: $PWD"
echo "Who is runnning the script: $USER"
echo "Direcrory of user is: $HOME"
echo "PID of the script is: $$"
sleep 40 &
echo "PID of the last command of background is: $!"