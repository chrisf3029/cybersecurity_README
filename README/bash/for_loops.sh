#!/bin/bash
states=('California' 'Washington' 'Texas' 'New York' 'Hawaii')

exists=0

for s in "${states[@]}"
do
	if [ "$s" = 'New York' ]
	then
		echo 'New York is the best!'
		exists=1
	fi
done

if [ $exists == 0 ]
then 
	echo 'I am not fond of New York'
fi

echo ""

nums=($(seq 0 1 9))

for n in ${nums[@]}
do
	if [ $n = 3 ] || [ $n = 5 ] || [ $n = 7 ]
	then
		echo $n
	fi
done

echo ""

lsDir=$(ls)
for obj in ${lsDir[@]}
do
	echo $obj
done

echo ""

execFiles=$(find /home -type f -perm 777 2> /dev/null)
for file in ${execFiles[@]}
do
	echo $file
done

