#!/bin/bash
#Prints Times and Dealers from log schedule file
if [ -z $1 ]
then
	echo "Prints times and dealers from log schedule file"
	echo Usage: ./list_roulette_dealers.sh [Date: i.e. 0310]
else
	awk -F' ' '{print $1, $2, $5, $6}' $1*
fi
