#!/bin/bash

START=$(date +%s)
sleep 10
END=$(date +%s)

TOTAL=$(($START-$END))

echo "Sleep time taken : $TOTAL sec"