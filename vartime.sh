#!/bin/bash

START=$(date +%s)
sleep 10
END=$(date +%s)

TOTAL=$(($END-$START))

echo "Sleep time taken : $TOTAL sec"