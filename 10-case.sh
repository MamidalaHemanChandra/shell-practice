#!/bin/bash

today=$1
case $today in
    "mon" ) echo "Monday" ;;
    "tue" ) echo "Tuesday" ;;
    "wed" ) echo "Wednesday" ;;
    "*" ) echo "Invalid Day" ;;
esac

