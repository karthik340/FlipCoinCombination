#!/bin/bash -x

declare -A singletDict

for (( i=0;i<10;i++ ))
do
if [ $((RANDOM%2)) -eq 1 ]
then
     result="HEADS"
else
     result="TAILS"
fi
singletDict[$i]=$result
done

