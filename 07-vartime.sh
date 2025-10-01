#!/bin/bash

START=$(date +%s)
sleep 10 
END=$(date +%s)

 TOTAL=$(${END}-${START})

 echo "Total time taken to compelete the Heman script = $TOTAL sec"