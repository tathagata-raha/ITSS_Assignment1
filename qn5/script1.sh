#!/bin/bash
# ls -lR > new.txt
# while read x; do 
# 	first=`echo $x | cut -d " " -f 6` 
# 	second=`echo $x | cut -d " " -f 7`
# 	third=`echo $x | cut -d " " -f 8`
# 	fourth=`echo $x | cut -d " " -f 9`
# 	final=`find "$PWD" -iname "$fourth" | sed "s|${PWD}|#|1"`
# 	if [ ! "$first" = "$second" ]]; then
# 	echo "${first}${second} ${third} ${final}"
# 	# echo "${second}"
# 	# echo "${third}"
# 	# echo "${final}"
# fi
# done < new.txt

function abcd {
	cd "$1"
	ls -l | while read x; do
		a=`echo $x | head -c 1`
		if [[ "$a" = "-" ]]; then
			first=`echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | cut -d " " -f 1`
			second=`echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | cut -d " " -f 2`
			third=`echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | cut -d " " -f 3`
			fourth=`echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | cut -d " " -f 4`
			echo "${fourth}${third} ${second} ${2}/${first}"
			# echo ok
		elif [[ "$a" = 'd' ]]; then
			first=`echo $x | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | cut -d " " -f 1`
			folder="${2}/${first}"
			path="${1}/${first}"
			abcd "$path" "$folder"
		fi
	done
}

abcd "$PWD" "#"

man -k lo | grep "^lo" > 2018114017.txt
echo `cat 2018114017.txt | wc -l`
echo `cat 2018114017.txt | wc -L`
cp 2018114017.txt backup.txt
sed -i 's/function/method/g' 2018114017.txt


