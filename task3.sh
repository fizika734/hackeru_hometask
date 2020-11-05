#!/bin/bash
# Init vars
echo 'Enter your IP addres'
echo 'Be carefull! There is no check for ip and prefix validity'
read IP
echo 'Enter the network prefix (only numbers. CIDR - not supported)'
read PREFIX

#ping only ip if prefix is 32
if [[ $PREFIX == 32 ]];then
	ping -c1 $IP > /dev/null
	if [ $? == 0 ];then
		echo "$IP - is UP"
	fi

#ping all hosts in last octad if prefix is 24
elif [[ $PREFIX -eq 24 ]];then
	host_range=`echo $IP | cut -d"." -f1,2,3`
	for i in `seq 0 255`;do
		ping -c1 ${host_range}.${i} > /dev/null
		if [ $? -eq 0 ];then
			echo "${host_range}.${i} - is UP"
		fi
	done

#ping all hosts in 3d and 4th octad if prexif is 16
elif [ $PREFIX -eq 16 ];then
	host_range=`echo $IP | cut -d"." -f1,2`
	for i in `seq 0 255`;do
		for j in `seq 0 255`;do
			ping -c1 ${host_range}.${i}.${j} > /dev/null
			if [ $? -eq 0 ];then
				echo "${host_range}.${i}.${j} - is UP"		
			fi
		done
	done

# ping all hosts in 2d, 3d and 4th octads
# I hope you wont try this
elif [ $PREFIX -eq 8 ];then
host_range=`echo $IP | cut -d"." -f1`
	for i in `seq 0 255`;do
		for j in `seq 0 255`;do
			for k in `seq 0 255`;do
				ping -c1 ${host_range}.${i}.${j}.${k} > /dev/null
				if [ $? -eq 0 ];then
					echo "${host_range}.${i}.${j} - is UP"		
				fi
			done
		done
	done	
fi