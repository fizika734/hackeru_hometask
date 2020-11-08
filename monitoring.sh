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

# there are 2 ways to run this script every 30 mins
# first one is put line "30 * * * * PATH_TO_SCRIPT" in to cron (crontab -e) 
# second one is to create a systemd unit with lines below
# [Unit]
# Description=Run scr

# [Service]
# User=%I
# Restart=always
# RestartSec=1800s
# ExecStart=/bin/bash PATH_TO_SCRIPT
# then you should run "sudo systemctl daemon-reload && sudo systemctl enable NAME_OF_UNIT_FILE"
# Also you can trigger a script by systemd timer