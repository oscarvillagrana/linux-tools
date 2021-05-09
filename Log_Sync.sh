# Log & Sync Manager

### plod command

# creates a log file with a tag comment
#$ plod <text>

# searches the current log file
$ plod -g hp-ux


#
###Rsync Command
#

# Debian Linux
$ apt-get install rsync

# RPN based Linux
yum install rsync

# Navigate to where files are located

# synchronizes 
$ rsync Original/* Backup/

# Original/*        --put source directory that we want to sync
                    --since we are not using any options we got to specify the files and not just the directory
# Backup/           --the destination of the sync

# makes sub-directory not included in sync
$ mkdir Original/More-Pics

# checks to see if Original/More-Pics is included
$ rsync Original/* Backup/
# output
skipping directory Original/More-Pics

# -r option to recurse in two directories and copy the total contents
$ rsync -r Original/ Backup/

# Original/         --trailing slash means to include sub-directories
# Original          --syncronizes the original directory itself instead updating the directory

# -a                --option (archive) is more common. recurse and two directories. copies symlinks. perserves permission modification times. groups owners.

### Run Dry Option

# need to pair dry-run option with verbose output

# displays files it would have copied
$ rsync -av --dry-run Original/ Backup/

# -av               --archive and verbose output option

# syncs files and displays actions
$ rsync -av Original/ Backup/

### DELETE FLAG ON EMPTY DIRECTORY CAN ERASE ALL BACKUP
# useful for website backup

# mirror our source and deletes files not in directory
$ rsync -av --delete --dry-run Original/ Backup/

### sync files between local and remote machine
# test machine with ssh access and ip address

# test website with html, javascript and css

# rsync has compress option for network data transfer -z & -P

# sync to a remote machine
$ rsync -zaP ~/Projects/my_site oscar@111.111.11.111:~/public/

# ~/Projects/my_site        --source
# oscar@111.111.11.111:     --destination
# ~/public/                 --location

# this works backwards as well --from remote machine (website) to home

### oscar at ubuntu-1 in my_site

$ mkdir backups

$ touch backups/backup.sql

$ exit
logout                                  --output
connection to 111.111.11.111 closed.    --output

### oscar at Oscars-Asus in ~

# sync the backup from our web server to our local machine

# we can just use the servers folder
$ rsync -zaP oscar@111.111.11.111:~/public/my_site/backups ~/Projects/my_site/

$ ls Projects/my_site

# commonly paired with cron jobs that schedule commands to run on regular intervals


#####################################################
#
# Crontab Command
#
#####################################################


# shows list of sheduled task for this user
$ crobtab -l

# uses nano instead of vim for editing crobtab
export EDITOR=/usr/bin/nano


# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command_to_execute

# edit list of cronjobs
$ crontab -e


# runs echo command and sends to text file
# appends every minute of every day
* * * * * echo 'Helo' >> /tmp/test.txt

# 30 mins past the 5th hour on the 1st of every month once a year
30 5 1 1 *

# runs at midnight every monday
0 0 * * 1 echo 'Hello' >> /tmp/test.txt

# runs on midnight for the first and the 15th day of every month
0 0 1,15 * * echo 'Hello' >> /tmp/test.txt

# must select a specific time to run it once in a day

### intervals with / operator

*/10 * * * * * echo 'Hello' >> /tmp/test.txt

# once every third day
0 0 */3 * * echo 'Hello' >> /tmp/test.txt

### Ranges with -

# every hour from midnight to 5 am
0 0-5 * * * echo 'Hello' >> /tmp/test.txt

# runs at noon every day May to August
0 12 * 5-8 * echo 'Hello' >> /tmp/test.txt

# every 30 mins mon-fri from 9am-5pm
*/30 9-17 * * 1-5 echo 'Hello' >> /tmp/test.txt

# Empty temp folder every Friday at 5pm
0 5 * * 5 rm -rf /tmp/*

# Backup images to Google Drive every night at midnight
0 0 * * * rsync -a ~/Pictures/ ~/Google\ Drive/Pictures/

# edit user2 crontabs
$ contab -u user2 -e

# to run as root user
$ sudo crontab -l

# edit as root user
$ sudo crontab -l

# removes all the created crontab
$ crontab -r

# list crontabs for user
$ crontab -l

# crontab.guru website shows schedule executions


#--------------------------------------------------
# Vim Editor
#--------------------------------------------------


# i for insert mode in vim