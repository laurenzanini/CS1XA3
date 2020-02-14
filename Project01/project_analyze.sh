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
	find ~/private/CS1XA3 -type f -print0 | while IFS= read -d '' file 
	do
		tail -n 1 $file | grep -q "#FIXME"
		if [ "$?" -eq 0 ] ; then
			echo "$(basename $file)" >> fixme.log
		fi
	done
	
	cat fixme.log

# finds the most recent commit with word 'merge', checks out commit automatically
elif [ "$1" = "merge" ] ; then
        gitlog=$(git log -1 --oneline | grep -i 'merge')
	echo $gitlog 

# prompts user for extension, outputs number of files in repo with said extension
elif [ "$1" = "file-count" ] ; then
	read -p "enter file extension to search for: " ext
	ls -lR ~/private/CS1XA3/ | grep ".$ext" |  wc -l

# prints invalid input when something is inputted that is not defined
else
	echo "invalid input"
fi



