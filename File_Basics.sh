Command                     Description
cat [filename]              Display file’s contents to the standard output device (usually your monitor).
cd /directorypath           Change to directory.
chmod [options]             mode filename   Change a file’s permissions.
chown [options]             filename    Change who owns a file.
clear                       Clear a command line screen/window for a fresh start.
cp [options]                source destination  Copy files and directories.
date [options]              Display or set the system date and time.
df [options]                Display used and available disk space.
du [options]                Show how much space each file takes up.
file [options]              filename    Determine what type of data is within a file.
find [pathname] [expression]    Search for files matching a provided pattern.
grep [options]      pattern [filesname]     Search files or output for a particular pattern.
kill [options]      pid     Stop a process. If the process refuses to stop, use kill -9 pid.
less [options] [filename]   View the contents of a file one page at a time.
ln [options]                source [destination]    Create a shortcut.
locate filename             Search a copy of your filesystem for the specified filename.
lpr [options]               Send a print job.
ls [options]                List directory contents.
man [command]               Display the help information for the specified command.
mkdir [options]             directory   Create a new directory.
mv [options]                source destination  Rename or move file(s) or directories.
passwd [name [password]]    Change the password or allow (for the system administrator) to change any password.
ps [options]                Display a snapshot of the currently running processes.
pwd                         Display the pathname for the current directory.
rm [options]    directory   Remove (delete) file(s) and/or directories.
rmdir [options] directory   Delete empty directories.
ssh [options]               user@machine    Remotely log in to another Linux machine, over the network. Leave an ssh session by typing exit.
su [options] [user [arguments]]     Switch to another user account.
tail [options] [filename]   Display the last n lines of a file (the default is 10).
tar [options]               filename    Store and extract files from a tarfile (.tar) or tarball (.tar.gz or .tgz).
top                         Displays the resources being used on your system. Press q to exit.
touch filename              Create an empty file with the specified name.
who [options]               Display who is logged on.


#############################################################
#
# New Commands
#
#############################################################

# the last word of the last command
!$


#############################################################
#
# Move, View & Create files
#
#############################################################

# see which folder (directory) we are in
$ pwd

# moves back up one directory
$ cd ..

# move up a directory to see all files
$ cd ..
$ ls

# moves wirking directory to SubDir1
$ cd SubDir

# prints files in directory
$ ls

# shows files and metadata
$ ls -lah

# shows all files 
$ ls -a

# creates tesrdir folder
$ mkdir testdir

# creates new directory
$ mkdir SubDir1

# creates the directory CopyDir
$ mkdir CopyDir

# moves back a directory and list files
$ cd ..
$ ls

# moves to CopyDir/
$ cd CopyDir/

# creates test_file.txt
$ touch test_file.txt

# uses default program to open file
$ open test_file.txt


#############################################################
#
# Copy & Rename 
# moving and renaming a file are the same process
#
#############################################################


# prints the list of options for cp command
$ man cp

# copies TestDir and its entire subtree into CopyDir directory
$ cp -R TestDir/ CopyDir/

# renames TestDir directory to OrigDir without needing additional options
$ mv TestDir OrigDir

# moves entire OrigDir directory to the CopyDir
# mv OrigDir/ CopyDir/

# moves OrigDir up one directory and renames
$ mv OrigDir/ ../TestDir

# copy & rename copy_file.txt
$ cp test_file.txt copy_file.txt

# copy and move orig_file.txt back one directory
$ cp orig_file.txt ../test_file.txt

# changes name to orig_file.txt and not location
$ mv test_file.txt orig_file.txt

# changes location and not name
$ mv orig_file.txt Subdir1/

# renames and moves orig_file.txt back one directory
$ mv orig_file.txt ../test_file.txt

# copy, rename and change location
$ cp orig_file.txt dir/copy_file.txt


#############################################################
#
# Delete Files and Directories 
# -DELETING FILES IN TERMINAL DELETS PERMINENTLY- i.e. does not go to a bin
#
#############################################################


# deletes file 
$ rm copy_file.txt

# deletes the directory permenetly
$ rm -R CopyDir/

# forces a deletion when files give you a problem with -F
$ rm -rf TestDir/

#
# Find Command
#

# lists all of the options for find
$ man find

# finds all the files in a current directory
$ find .

# finds all the files and directories within the specific directory website_demo
$ find website_Demo

# finds only the directories in the current directory
$ find -type d

# finds only the files in the current directory
$ find -type f

# finds exact file 
$ find -type f -name "test_1.txt"


#############################################################
#
### wild card 
#
#############################################################


# finds all the files begining with test

# case sensitive
$ find . -type f -name "test*"

# case insensitive
$ find . -type f -iname "test*"

### filtering for a certain extension

# finds all the python files
$ find . -type f "*.py"

### filtering on file metadata

# modified in the last ten minutes
$ find . -type f -mmin -10

# modified more than ten minutes
$ find . -type f -mmin +10

# last modified a certain number or days
$ find . -type f -mtime -20

# last modified a certain number or days
$ find . -type f -mtime +20

# modified mins & days
$ mmin 
$ mtime

#accessed mins and days
$ amin 
$ atime

# changed mins and days
$ cmin 
$ ctime


#############################################################
#
### filter by file size
#
#############################################################


# find all the files over a certain size
$ find . -size +5M

# M = Megabites 
# k = Kilabites
# G = Gigabites

# shows files and metadata
$ ls -lah

# shows empty file
$ find . -empty

# finds files that have permission number 777
$ find . -perm 777

#
### Performing actions on files
#


# changes permision levels
$ find Website_Demo -exec chown oscar-ev:www-data {} *

# chow          --changes owner
# exec          --executes command on results
# Website_Demo  --find command results for folder
# oscar-ev:     --user
# www-data      --this is the 'group'
# {}            --placeholder since using find results. chown command uses file or directory option in this possition.
# +             --ends command

# shows user and group where changed
$ls -la Website_demo/

# changes permission number to 775
$ find Website_Demo -type d -exec chown 775 {} +

# shows permision to see if last permission change worked
$ find Website_Demo -perm 775

# changes permission number to 664
$ find Website_Demo -type f -exec chown 664 {} +

# shows permision to see if last permission change worked
$ find Website_Demo -perm 664

# when deleting or modifing files 
# run find command first 
$ find . -type f -name "*jpg" 

# deletes all image files with
$ find . -type f -name "*jpg"

# excludes files in the subdirectory
$ find . -type f -name "*jpg" -maxdepth 1

# maxdepth 1    --only searches down one directory which is current directory

# deletes all the jpeg files in current directory
$ find . -type f -name "*jpg" -maxdepth 1 -exec rm {} +

# exec          --executes of find results
# rm            --remove option for exec command