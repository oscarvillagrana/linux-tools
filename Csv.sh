### csv script to read csv files in bash

# displays all the information in the csv file
$ cat contacts.csv

# gives a better view of csv file
# <command> <file>
parsecsv.sh contacts.csv

# using grep to filter 
$ parsecsv.sh directory.csv | grep Jill -A3

# |		--pipes output to grep
# grep		--word match search
# -A3 		--minus option to see three lines afterwards


$ parsecsv.sh contacts.csv | grep Operator -B1

### script

$ vi bin/csv.sh

# makes copy of current file seperator


#!/bin/bash
#This file was created on 03/26/19
OLDIFS=$IFS
IFS=","

while read user job uid location

 do
	echo -e "\e[1;33m$user \
	======================\e[0m\n\
	ROLE : \t $job\n\
	ID : \t $uid\n\
	SITE: \t $location\n"
 done < $1
 IFS=$OLDIFS
