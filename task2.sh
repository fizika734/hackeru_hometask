#!/bin/bash
if [ -f append_file ];then
	echo "enter new text line"
	read 
	echo ${REPLY} >> append_file
else
	echo "file append_file doesnt exist"
	exit 1
fi