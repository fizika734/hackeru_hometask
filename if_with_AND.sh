#!/bin/bash
echo 'Enter the username and password in one line'
echo 'example: '
echo 'USERNAME PASSWORD'
read username password
if [[ $username == admin ]] && [[ $password == secret ]];then
	echo 'login success'
else
	echo 'login failure'
fi