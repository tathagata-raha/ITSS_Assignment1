#!/bin/bash
declare -i flag
declare -i count
if [[ ! -e reminders.txt ]];then
	touch reminders.txt
fi
if [[ "$#" -ge 1 ]]; then
	# echo ok
	if [[ "$1" = "create" ]]; then
		echo "notify-send \"$2\"" | at $3 $4 2> temp2
		count=`tail -n 1 temp2 | cut -f 2 -d " "`
		date2=""
		month=`tail -n 1 temp2 | cut -f 5 -d " "`
		date1=`tail -n 1 temp2 | rev | cut -f 3 -d " "`
		date2="${month} ${date1}"
			# echo $date2 $date1 $month
		# else
			# date2="$4"
		# fi
		rm temp2
		echo $count $2 $3 $date2 >> reminders.txt
		echo "Reminder set with id = "$count $4
	elif [[ "$1" = "delete" ]]; then
		echo "Deleting reminder with id = "$2
		id=$2
		awk -v d1="$id" '( $1!=d1 )' reminders.txt > temp.txt && mv temp.txt reminders.txt  
		atrm $2
	elif [[ "$1" = "list" ]]; then
		echo "Here's the list you've set so far:"
		sort -k5M -k6n -k4 reminders.txt
	elif [[ "$1" = "edit" ]];then
		# if [ $# -eq 3 ];then
		# 	id=$2
		# 	time=$3
		# 	awk -v d1="$id" -v dtime="$time" '{ if ($1==d1) $2=dtime; print $0 }' reminders.txt > temp.txt && mv temp.txt reminders.txt  
		# else if [ $# -eq 4 ];then
		id1=$2
		time1=$4
		message=$3
		atrm $id1
		echo "notify-send \"$message\"" | at $time1 $5 2> temp2
		count=`tail -n 1 temp2 | cut -f 2 -d " "`
		month=`tail -n 1 temp2 | cut -f 5 -d " "`
		date1=`tail -n 1 temp2 | cut -f 7 -d " "`
		date2="${month} ${date1}"<time in HH:MM format> <optional date in MMMDD format>
		rm temp2
		awk -v d1="$id1" -v count="$count" -v dtime="$time1" -v dm="$message" -v ddate="$date2" -v empty="" '{ if ($1==d1) {$1=count; $2=dtime; $3=dm; $4=ddate; $5=empty } print $0 }' reminders.txt > temp.txt && mv temp.txt reminders.txt
		echo "Edited reminder set with id $count"  
		# fi
	else
		echo "Wrong usage.Refer readme file"
	fi
else
	echo "Wrong usage.Refer readme file"
fi