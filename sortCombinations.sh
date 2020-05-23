#!/bin/bash -x

function sort()
{
local store
store=($(echo "$@"))
for (( i=0;i<${#store[@]};i++ ))
do
for (( j=1;j<${#store[@]};j++ ))
do
previous=${store[$(($j-1))]}
current=${store[$j]}
if [ $previous -lt $current ]
then
store[$(($j-1))]=$current
store[$j]=$previous
fi
done
done
echo  ${store[@]}
}



declare -A tripletcount
declare -A singletcount
declare -A doubletcount
outcomes=('H' 'T')

counter1=0
counter2=0
for (( i=0;i<2;i++ ))
do
for (( j=0;j<2;j++ ))
do
     doubletcomb[((counter1++))]="${outcomes[$i]}${outcomes[$j]}"
for (( k=0;k<2;k++ ))
do
      tripletcomb[((counter2++))]="${outcomes[$i]}${outcomes[$j]}${outcomes[$k]}" 
done 
done
done


for (( i=0;i<2;i++ ))
do
      singletcount[${outcomes[$i]}]=0
done
for (( i=0;i<4;i++ ))
do
      doubletcount[${doubletcomb[$i]}]=0
done
for (( i=0;i<8;i++ ))
do
      tripletcount[${tripletcomb[$i]}]=0
done

total=10
for (( i=0;i<$total;i++ ))
do
     comb=${outcomes[$((RANDOM%2))]}
     singletcount["$comb"]=$((${singletcount["$comb"]}+1))
     comb=${doubletcomb[$((RANDOM%4))]}
     doubletcount["$comb"]=$((${doubletcount["$comb"]}+1))
     comb=${tripletcomb[$((RANDOM%8))]}
     tripletcount["$comb"]=$((${tripletcount["$comb"]}+1))
done

counter1=0
counter2=0
counter3=0

for i in ${singletcount[@]}
do
singletsort[((counter1++))]=$i
done

for i in ${doubletcount[@]}
do
doubletsort[((counter2++))]=$i
done

for i in ${tripletcount[@]}
do 
tripletsort[((counter3++))]=$i
done

arg1=$(echo ${singletsort[*]})
singletsort=($(sort $arg1))

arg1=$(echo ${tripletsort[*]})
tripletsort=($(sort $arg1))

arg1=$(echo ${doubletsort[*]})
doubletsort=($(sort $arg1))

echo ${singletsort[@]}
echo ${doubletsort[@]}
echo ${tripletsort[@]}

for i in "${!singletcount[@]}"
do
    if [ ${singletsort[0]} -eq ${singletcount[$i]} ]
    then
        singletwinner=$i
     fi
done

for i in "${!doubletcount[@]}"
do
if [ ${doubletsort[0]} -eq ${doubletcount[$i]} ]
    then
        doubletwinner=$i
     fi
done

for i in "${!tripletcount[@]}"
do 
    if [ ${tripletsort[0]} -eq ${tripletcount[$i]} ]
    then
        tripletwinner=$i
     fi

done

