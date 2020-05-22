#!/bin/bash -x

function flipcoin()
{
if [ $((RANDOM%2)) -eq 1 ]
then
     echo "H"
else
     echo "T"
fi
}


declare -A doubletcount

myarray=('HH' 'TT' 'HT' 'TH')

for (( i=0;i<4;i++ ))
do
doubletcount[${myarray[$i]}]=0
done

total=10
for (( i=0;i<$total;i++ ))
do
     comb1=$(flipcoin)
     comb2=$(flipcoin)
     doubletcount["$comb1$comb2"]=$((${doubletcount["$comb1$comb2"]}+1))
done

declare -A doubletpercent

for (( i=0;i<4;i++ ))
do
    comb=${myarray[$i]}
    doubletpercent[$comb]=$((${doubletcount[$comb]}*100))
    doubletpercent[$comb]=`echo "scale=2; ${doubletpercent[$comb]}/$total" | bc -l`
done


