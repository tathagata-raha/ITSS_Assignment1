#!/bin/bash
if [ $# -eq 2 ]; then
	echo $2
	# curl $2 | cat > new.txt
	# echo $sor
	# curl $2 > file2
	# curl $2 | sed '/<script type="text\/javascript"/,/<\/script>/d' | sed '/<style/,/<\/style>/d' |sed -e 's/<[^>]*>//g'  > file3
	# curl $2 | sed '/<script/,/<\/script>/d' | sed '/<style/,/<\/style>/d' |sed -e 's/<[^>]*>//g'  > file
	asd=`curl -s $2 | sed '/<script/,/<\/script>/d' | sed '/<style/,/<\/style>/d' |sed -e 's/<[^>]*>//g' | grep -o -i "$1" | wc -l`

	# curl $2 | sed -e 's/<[^>]*>//g' > file

	# grep "$1 $asd"
	echo "$1 $asd"
else
	echo Enter the correct number of arguments
	echo Usage: './searching.s h <searchString> <url>'
fi