#!/bin/bash
files=("/etc/shadow" "/etc/passwd")
for f in "${files[@]}"
do
	echo "$f: $(ls -l $f | awk -F' ' '{print $1, $3, $4}')"
done

directories=$(ls /home)
for d in ${directories[@]}
do
	if [ -d /home/$d ]
	then
		echo $d: $(sudo -l -U $d | tail -1)
	fi
done

list=($(date) $(uname -a) $(hostname -s))
