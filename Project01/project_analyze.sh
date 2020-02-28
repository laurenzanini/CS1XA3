#!/bin/bash

# start of script

# checks if the input from user is equal to zero or greater than one
if [ "$#" -eq 0 ] || [ "$#" -gt 1 ] ; then
	echo "invalid input"
	exit
fi
# check if the input from user matches input defined
# finds files with #FIXME, puts files in list separated by newline
if [ "$1" = "fix" ] ; then
	:> fixme.log
	find .. -type f -print0 | while IFS= read -d '' file 
	do
		tail -n 1 $file | grep -q "#FIXME"
		if [ "$?" -eq 0 ] ; then
			echo "$(basename $file)" >> fixme.log
		fi
	done

# finds the most recent commit with word 'merge', checks out commit automatically
elif [ "$1" = "merge" ] ; then
        gitlog=$(git log -1 --oneline | grep -i 'merge')
	echo $gitlog

# prompts user for extension, outputs number of files in repo with said extension
elif [ "$1" = "file-count" ] ; then
	read -p "enter file extension to search for: " ext
	ls -lR .. | grep ".$ext" |  wc -l

# prompts user to change or restore file permissions
# if user wants to change, changes permissions of all shell scripts so that those who have write permissions also have executable permissions, stores old permissions and files in a log
# if  user wants to restore, original permissions of files changed get restored
elif [ "$1" = "execute" ] ; then
	if ! [ -f "permissions.log" ] ; then
		:> permissions.log
	fi
	read -p "Would you like to Change or Restore? " prompt
	if [ $prompt  = "c" ] ; then
		:> permissions.log
		find .. -type f -name "*.sh" -print0 | while IFS= read -d '' file
	 	do
			echo "$file"
			old=$(stat -c "%a %n" "$file")
			groups=(u g o)
			for ((i=3 ; i < 10 ; i+=3)); do
				count=$(echo "scale=0;$i / 3 - 1" | bc -l)
    				if [ $(ls -l "$file" | cut -d ' ' -f 1 | cut -c $i) = "w" ] ; then
     					chmod "${groups[$count]}+x" "$file"
   				else
     					chmod "${groups[$count]}-x" "$file"
   				fi
  			done
			echo "$old"  >> permissions.log
		done
	elif [ $prompt = "r" ] ; then
		while IFS= read -r line
		do
			IFS=' ' read old file <<< $line
			chmod "$old" "$file"
		done <<< $(cat "./permissions.log")
	else
		echo "invalid input"
	fi

# lists all files in repo and their sizes in human readable format, lists files from largest to smallest
elif [ "$1" = "size" ] ; then
	find .. -type f -print0 | xargs -r0 du -h | sort -rh


# prompts user for a Tag (any word), finds all lines in every python file that start with a comment and include said Tag, puts them into a log
elif [ "$1" = "tag" ] ; then
	:> Tag.log
	read -p "enter a word: " prompt
	find .. -type f -name "*.py" -print0 | while IFS= read -d ''  file
	do
		 egrep "^#.*${prompt}.*" $file
	done

# CUSTOM FEATURE 01
# orders every file alphabetically, appends all files to log separated by newline
elif [ "$1" =  "alphabet" ] ; then
	:> alphabetical.log
	 ls -1 .. >> alphabetical.log

# CUSTOM FEATURE 02
# finds all files with same name but different extension, appends the number of files with the same name but different extension, and the last line of each file to a log
elif [ "$1" = "samename" ] ; then
	:> samename.log
	thefiles=$(find .. -type f -exec bash -c 'basename "$0" "$.{0##*.}"' {} \; | sort | uniq -w 4 -D)
	find .. -type f -exec bash -c 'basename "$0" "$.{0##*.}"' {} \; | sort | uniq -w 4 -D | wc -l >> samename.log
	tail -n 1 $thefiles >> samename.log

# prints invalid input when something is inputted that is not defined
else
       echo "invalid input"
fi
