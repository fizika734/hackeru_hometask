#!/bin/bash
counter=0
while read i;do
	if [[ $1 == $i ]];then
		((counter=counter+1))
	fi
done
echo $counter