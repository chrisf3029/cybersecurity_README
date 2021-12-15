#!/bin/bash
#Finds specific dealer and working time from log schedule file
if [ -z "$1" ] || [ -z "$2" ]
then
	echo "Finds specific dealer and working time from log schedule file"
	echo "Usage: ./roulette_dealer_finder_by_time.sh [date: i.e. 0310] [time: i.e. \"10:00:00 AM\"]"
else
	bash list_roulette_dealers.sh "$1*" | grep "$2"
fi

