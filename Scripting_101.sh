#!/usr/bin/env bash
# Scripting 101

### make all files and folders in the current directory 744 permision
$ sudo chmod -R 744 ./


### make file executable

# in bash
$ chmod +x pyls.py 				# makes file 'pyls.py' executable 



# in Bash
user:~$ function shfun()
> {
> printf "Hello function\n"
> }
user:~$ for (( i=0 ; i < 5 ; i ++))
> do
> shfunc
> done
Hello function
Hello function
Hello function
Hello function
Hello function



#A System Information Gathering Script

# Command 1
function uname_func ()
{
	UNAME="uname -a"
	printf "Gathering system information with the $UNAME command: \n\n"
	$UNAME
}
# Command 2
function disk_func ()
{
	DISKSPACE="df -h"
	printf "Gathering diskspace information with the $DISKSPACE command: \n\n"
	$DISKSPACE
}
# Main function that calls other functions
function main ()
{
	uname_func
	disk_func
}

main

######################################################
#
### Stdin Stdout
#
######################################################

# Standard Output - sends the context of the folder selected to be displayed. Anything displayed on your screen.

# displays the context of a text file
$ cat 'Commands Unix'

# [>] redirects the standard output of ls command to a txt file. Creates the file if it does not exist.
$ ls ~/Desktop/Projects/Programming-Guide > testfile

# stdin is designated by a 0
# stdout is designated by a 1
# stderr is designated by a 2

# specifies standard output to be redirected to new file
$ ls ~/Desktop/Projects/Programming-Guide 1> testfile1

# specifies standard error to be redirected to new file
$ ls /root 2> testfile2

### Appending output

# prints string in quotation marks
$ echo "Hi"

# adds the word hello to the end of testfile
$ echo "Hello" 1>> testfile
