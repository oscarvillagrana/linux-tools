# Bash_profile and Bashrc files

# bash_profile 				--used for login shells
# bashrc 					--used for non login shells

# changes to home directory
$ cd ~

# shows all dot files
$ ls -la

# gets rid of previous custumisations by moving to temp folder
$ mv .bash_profile DotFiles/

# creates files
$ touch .bash_profile
$ touch .bashrc

# opens file with vim editor
$ vim .bash_profile

# in vim editor
echo 'FROM BASH_PROFILE'

# opens file with vim editor
$ vim .bashrc

# in vim editor
echo 'FROM BASHRC'

### THESE FILES ARE RUN EVERYTIME YOU SSH INTO A MACHINE

# allows modifications of a single file to be applied to all shells

# in .bash_profile file
if [ -f -/.bashrc]; then		--if this file exist
	source ~/.bashrc 			--execute bashrc file
fi 								--finishes the if loop

### Usefull Linux commands to get to know 

# gives definition and variables of the command 'regex'
$ whatis regex

# prints the manual to the command 'regex'
$ man regex

# prints the location of the file 'python' but not as usefull as 'type' command
$ where python

# prints the location of the file and of any alias to the file 'python'
$ type python

# creates text file 'Usefull_commands.txt'
$ touch usefull_commands.txt

#####################################################
#
# User Account Managing
#
#####################################################

# Essential System Admin. pg.565.0

### creating a new user

## assign a username, user ID and a primary group plus additional groups

## assign a password for the user 

# adds user 'chavez' to file /etc/passwd
passwd chavez


## create home directory for user

mkdir /home/chavez

# change ownership of home dir
chown chavez.chem /home/chavez

# change access permission
chmod 755 /home/chavez

## place initialization files in the user's home dir



## use shown and/chgrp to give the new user ownership of his home dir and files

## Set parametes (psswd aging, acc expiration, resource limits and sys privileges)



