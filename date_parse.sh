#!/bin/bash
# i didnt understood the correct format of the output
# i hope you meant something like this
declare -A Date=$(date +'([year]=%Y [month]=%m [day]=%d [hour]=%H [min]=%M [sec]=%S )')
echo -e "Year=${Date[year]} \nMonth=${Date[month]} \nDay=${Date[day]} \nHour=${Date[hour]} \nMin=${Date[min]} \nSec=${Date[sec]}"