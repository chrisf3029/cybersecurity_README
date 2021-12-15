#!/bin/bash
#Checks the times and days where the roulette losses occurred
for day	in "0310*" "0312*" "0315*"
do
	echo $day
	for t in "05:00:00 AM" "08:00:00 AM" "02:00:00 PM" "08:00:00 PM" "11:00:00 PM"
	do
		if [ "$day" != "0315*" ] || [ "$t" != "11:00:00 PM" ]
		then
			bash list_roulette_dealers.sh $day | grep "$t" 
		fi
	done
done


