#!/bin/bash
if [ $# -eq 1 ]; then
	declare -i int
	int=1
	while [ $int -le $1 ]; do
		echo "Cycle $int : Get to work"
		# notify-send "Cycle $int : Get to work"
		sleep 1500
		# echo "Cycle $int : Break time"
		# # notify-send "Cycle $int : Break time"
		# sleep 1
		declare -i temp
		temp=int%4
		if [ $temp -eq 0 ]; then
			echo "Cycle $int : Take a long break"
			# notify-send "Take a long break"
			sleep 900
		else
			echo "Cycle $int : Break time"
			# notify-send "Cycle $int : Break time"
			sleep 300
		fi
		((int++))
	done
	echo Finished
	# notify-send "Finished"
else
	echo Enter the correct number of arguments
	echo Usage: './timer.sh <number_of_itiretions>'
fi