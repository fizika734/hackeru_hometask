#!/bin/bash
#init vars
mem_total=`free --mega | grep Mem | awk '{print $2}'| grep -oP '^\d*'`
mem_used=`free --mega | grep Mem | awk '{print $3}'| grep -oP '^\d*'`
processes=`ps -aux | wc -l`
load_average=`uptime | grep -oP 'load.*'`
users=`users`

#format output
echo "Memory Usage: $mem_used MB of $mem_total MB"
echo "Processes: $processes"
echo $load_average
echo "Logged users: $users"
