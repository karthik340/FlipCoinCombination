#!/bin/bash -x
if [ $((RANDOM%2)) -eq 1 ]
then
     result="HEADS"
else
     result="TAILS"
fi

