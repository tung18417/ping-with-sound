#!/bin/bash

count=0

if [[ $1 == '' ]]; then
	echo "Enter your ip first."
else
	while :
	do
		t=$(ping -c1 $1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &)
		if [[ $1 == $t ]]; then
			echo -en "\007" #play alert sound
			ping -c 1 $1 | grep "64 bytes"
			sleep 3
		else
			e=$(ping -c 2 $1 | grep "Request timeout" | cut -c -29)
			echo $e$count	#show ip + count 
			count=$(($count+1))
		fi
	done
	
fi


