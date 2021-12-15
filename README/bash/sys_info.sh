#!/bin/bash

if [ $UID = 0 ]
then
	echo EXIT: DO NOT use as ROOT
	exit 0
fi

output=~/research
inet=$(ip addr | grep 'inet ' | tail -2 | head -1)
execfiles=$(find /home -type f -perm 777 2> /dev/null)


if [ ! -d $output ] 
then
	mkdir ~/research
fi

if [ -f $output/sys_info.txt ] 
then
	rm -f "$output/sys_info.txt"
fi

echo -e "\n-----SYSTEM INFO-----" >> $output/sys_info.txt
echo -e "\n$(date)" >> $output/sys_info.txt
echo -e "\nMachine Type Info info: $(uname -a)" >> $output/sys_info.txt
echo -e "\nIP info: $inet" >> $output/sys_info.txt
echo -e "\nHostname: $HOSTNAME" >> $output/sys_info.txt
echo -e "\nDNS:\n$(grep --color=never 'nameserver ' /etc/resolv.conf)" >> $output/sys_info.txt
echo -e "\nMemory Info:\n$(free)" >> $output/sys_info.txt
echo -e "\nCPU Info:\n$(lscpu | grep --color=never CPU)" >> $output/sys_info.txt
echo -e "\nDISK Usage:\n$(df -H | head -2)" >> $output/sys_info.txt
echo -e "\nCurrent Users:\n$(who -a)" >> $output/sys_info.txt
echo -e "\nExec Files:\n$execfiles" >> $output/sys_info.txt
echo -e "\nTop 10 Processes:" >> $output/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output/sys_info.txt
echo "" >> $output/sys_info.txt

files=("/etc/shadow" "/etc/passwd")
echo -e "File Permissions:" >> $output/sys_info.txt
for f in "${files[@]}"
do
	echo "$f: $(ls -l $f | awk -F' ' '{print $1, $3, $4}')" >> $output/sys_info.txt
done

echo -e "\nSUDO Permissions" >> $output/sys_info.txt
directories=$(ls /home)
for d in ${directories[@]}
do
	if [ -d /home/$d ]
	then
		uid=$(id $d 2>/dev/null)
		if [ "$uid" != "" ]
		then
			echo $d: $(sudo -lU $d | tail -1) >> $output/sys_info.txt
		fi
	fi
done

list=("date" "uname -a" "hostname -s")
for cmd in "${list[@]}"
do
	echo -e "\nThe results of the $cmd command are:" >> $output/sys_info.txt
	echo $($cmd) >> $output/sys_info.txt
done

echo ""  >> $output/sys_info.txt



