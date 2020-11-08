#!/bin/bash
for user in `cat usernames`;do
	password=`pwgen 8 1`
	encrypted_password=`perl -e 'print crypt($ARGV[0], "password")' $password`
	sudo useradd -m -p "$encrypted_password" "$user"
	if [ -f  /var/userpassword.txt ];then
		sudo chown $USER: /var/userpassword.txt
	else
		sudo touch /var/userpassword.txt
		sudo chown $USER: /var/userpassword.txt
	fi
	echo "$user:$password" >> /var/userpassword.txt
done