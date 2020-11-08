#!/bin/bash
for port in $@;do
	touch ${port}.txt
	# i know its not the best solution but it works pretty good
	grep -oP ".*(${port}\/open)" nmap_out.txt | grep -oP '\d*\.\d*\.\d*\.\d*' >> ${port}.txt
done