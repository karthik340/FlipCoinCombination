#!/bin/bash -x

declare -A tripletcount

outcomes=('H' 'T')
counter=0
for (( i=0;i<2;i++ ))
do 
for (( j=0;j<2;j++ ))
do
for (( k=0;k<2;k++ ))
do
myarray[((counter++))]="${outcomes[$i]}${outcomes[$j]}${outcomes[$k]}" 
done 
done
done



for (( i=0;i<8;i++ ))
do
tripletcount[${myarray[$i]}]=0
done

total=100
for (( i=0;i<$total;i++ ))
do
     comb=${myarray[$((RANDOM%8))]}
     tripletcount["$comb"]=$((${tripletcount["$comb"]}+1))
done

declare -A tripletpercent

for (( i=0;i<8;i++ ))
do
    comb=${myarray[$i]}
    tripletpercent[$comb]=$((${tripletcount[$comb]}*100))
    tripletpercent[$comb]=`echo "scale=2; ${tripletpercent[$comb]}/$total" | bc -l`
done


