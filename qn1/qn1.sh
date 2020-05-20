#!/bin/bash
function usage {
	echo "Wrong usage"
	echo "Type \"./qn1.sh help\" for manual"
}

function exists {
	declare -i temp
	declare -i int=0
	file=songs.csv
	while read line; do
    	temp1=`echo $line | cut -d "," -f 1`
	    # echo "$temp1 $1 $line"
	    ((int=int+1))
	    if [[ "$1" == "$temp1" ]]; then
		   	temp=`echo $int+0 | bc`
		   	break
	   	fi
	done < $file
	return $temp
}
function exists2 {
	declare -i temp
	declare -i int=0
	file=songs.csv
	while read line; do
    	temp1=`echo $line | cut -d "," -f 2`
	    # echo "$temp1 $1 $line"
	    # ((int=int+1))
	    if [[ "$1" == "$temp1" ]]; then
		   	echo $line | cut -d "," -f 1
		   	((int=int+1))
	   	fi
	done < $file
	if [ $int -eq 0 ]; then
		echo No matches found
	fi
}
function delete {
	declare -i temp
	declare -i int=0
	file=songs.csv
	while read line; do
    	temp1=`echo $line | cut -d "," -f 1`
	    # echo "$temp1 $1 $line"
	    ((int=int+1))
	    if [[ "$1" == "$temp1" ]]; then
		   	temp=`echo $int+0 | bc`
		   	break
	   	fi
	done < $file
	sed -i "${temp}d" songs.csv
}
function help {
	echo "#################################################MANUAL#################################################################"
	echo "./qn1.sh [OPTION] [SONG_NAME] [OTHER_OPTION]"
	echo "The available options are:"
	echo
	echo "add : Adds a song to the song diary"
	echo "Usage : ./qn1.sh add [SONG_NAME] [ARTIST](ARTIST is optional)"
	echo
	echo "edit : Edits a song in the song diary"
	echo "Usage : ./qn1.sh edit [SONG_NAME_TO_BE_EDITED] [EDITED_SONG_NAME] [EDITED_ARTIST_NAME](EDITED_ARTIST_NAME is optional)"
	echo
	echo "delete : Deletes a song from the song diary"
	echo "Usage : ./qn1.sh delete [SONG_TO_BE_DELETED]"
	echo
	echo "view : Views all songs in the song diary in table format"
	echo "Usage : ./qn1.sh view"
	echo
	echo "view-songs-of-artist : Views all songs in the song diary of a particular artist"
	echo "Usage : ./qn1.sh view-songs-of-artist [ARTIST_NAME]"
	echo
	echo "setup : Setups the file in any system so that it can be accessed from any directory"
	echo "Usage : ./qn1.sh setup"
	echo
	echo "help : Shows the manual for using the script"
	echo "Usage : ./qn1.sh help"
	echo
	echo "If there are multiple words for an option, try to use it in quotes"
}
if [[ ! -e songs.csv ]]; then
	touch songs.csv
fi
if [ $# -ge 1 ]; then

	if [[ "$1" = "add" && ($# -eq 2 || $# -eq 3) ]]; then 
		exists "$2"
		if [ $? -eq 0 ]; then
			if [ $# -eq 2 ]; then
				echo "$2" >> songs.csv
			elif [ $# -eq 3 ]; then
				echo "$2,$3" >> songs.csv
			else
				usage
			fi
		else
			echo Song already exists
			echo "Type \"./qn1.sh edit\" to edit the song"
			echo "Or enter a new song"
		fi
	elif [[ "$1" = "edit" && ($# -eq 3 || $# -eq 4) ]]; then
		exists "$2"		
		if [ $? -ne 0 ]; then
			exists "$3"
			if [ $? -eq 0 ]; then
				delete "$2"
				if [ $# -eq 3 ]; then
					echo "$3" >> songs.csv
				elif [ $# -eq 4 ]; then
					echo "$3,$4" >> songs.csv
				else
					usage
				fi
			else
				echo Edited song name already exists
				echo "Enter a new song name"
			fi
		else
			echo Song to be edited doesn\'t exist
			echo Enter correct song name
		fi
	elif [[ "$1" = "delete" && $# -eq 2 ]]; then
		exists "$2"		
		if [ $? -ne 0 ]; then
			delete "$2"
		else
			echo Song doesn\'t exist
			echo Enter correct song name
		fi
	elif [[ "$1" = "view" && $# -eq 1 ]]; then
		echo SONG_NAME ARTIST
		column -s, -t < songs.csv
	elif [[ "$1" = "view-songs-of-artist" && $# -eq 2 ]]; then
		exists2 "$2"
	elif [[ "$1" = "help" && $# -eq 1 ]]; then
		help
	elif [[ "$1" = "setup" && $# -eq 1 ]]; then
		sudo echo "export PATH=$PWD:\$PATH" >> ~/.bashrc
	else
		usage
	fi
else
	usage
fi