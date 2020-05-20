#!/bin/bash
# echo $2

mkdir $2Awesome
mkdir $2Good
mkdir $2Average
mkdir $2Bad
for i in $2*; do
	if [[ -f $i ]]; then
		temp=`echo "$(basename "$i")" | cut -d "." -f 1`
		# declare -i temp2
		temp2=`grep $temp $1 | cut -d ":" -f 2` 
		echo $temp2
		# echo $temp
		if (( $(echo "$temp2>9.0" | bc) )); then
			touch $2Awesome/${temp}.mp4
		elif (( $(echo "$temp2>8.0" | bc) )); then
			touch $2Good/${temp}.mp4
		elif (( $(echo "$temp2>5.0" | bc) )); then
			touch $2Average/${temp}.mp4
		else
			touch $2Bad/${temp}.mp4			
		fi
	fi
done