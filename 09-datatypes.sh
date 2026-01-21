#!/bin/bash

Number1=100
Number2=200
Number=Heman

Sum=$(($Number1 + $Number2 + $Number))
echo "Sum is: $Sum"

Heros=("Mahesh" "NTR" "Prabas" "Nani")
echo "TFI Heros are: ${Heros[$@]}"
echo "TFI Heros are: ${Heros[$*]} "
echo "First Hero is: ${Heros[0]}"
echo "Third Hero is: ${Heros[2]}"
echo "Seventh Hero is: ${Heros[7]}"

