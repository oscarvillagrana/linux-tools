#!/usr/bin/env bash
# sh System Information Gathering Script


#---------------------------------------------
# Manage network files from web server
#
# --2 option does not work well in many versions. So always erase
# -o option outputs message to file to not overload terminal
#---------------------------------------------


# download data into ssh host
curl -o


#-----------------------------------------------
### "system activity report" command-line data extraction
#-----------------------------------------------


# check running processes
$ ps -ef

$ sar

### Commands that yield comminly monitored parameters

# free and used disc space and inodes
$ df

# --human-readable and --inodes
$ df -hi

# directory sizes
$ du

# free, used and swap (virtual) memory
$ free

# disk performance and throughput
$ iostat

# open files and network ports
$ lsof

# per-processor unilization on multiprocessor systems
$ mpstat

# process, cpu, and memor statistics
$ vmstat


#---------------------------------------------
# Managing package instalations
#---------------------------------------------


sudo apt install ./code_1.37.1-1565886362_amd64.deb 

dpkg-query -s code

apt-cache search vscode

dpkg -l dirmngr

ls *.deb
# [Output]:
# epson-printer-utility_1.0.2.deb

$ sudo dpkg-deb -W epson-printer-utility_1.0.2.deb
# [Output]:
# epson-printer-utility  1.0.2-1lsb3.2

cp epson-printer-utility_1.0.2.deb abcde.deb


$ sudo dpkg-deb -W abcde.deb
# [Output]:
# epson-printer-utility   1.0.2-1lsb3.2

sudo dpkg-query -s $(dpkg-deb -f abcde.deb | grep "Package" | cut -d: -f2)

# [Output]:
# Package: epson-printer-utility
# Status: install ok installed
# Priority: extra
# Section: alien
# Installed-Size: 10652
# Maintainer: Seiko Epson Corporation <linux-printer@epson.jp>
# Architecture: amd64
# Version: 1.0.2-1lsb3.2
# Depends: lsb (>= 3.2)
# Description: Epson Printer Utility for Linux


#-----------------------------------------------
# Managing diskspace
#-----------------------------------------------


#Command 1
UNAME = "uname -a"
printf "Gathering system information with the $UNAME command: \n\n"
$UNAME

#Command 2
DISKSPACE="df -h"
printf "Gathering diskspace information with the $DISKSPACE command: \n\n"
$DISKSPACE


#-----------------------------------------------
# Stopwatch functions
#-----------------------------------------------


# Start:
$ time cat

# Stop:
$ ctrl+c

# Another version

# Start:
time read

# Stop:
(press Enter)


#--------------------------------------------------
# Systems Monitoring
#--------------------------------------------------


# UNIX and Linux System Administration Handbook 28.6

# Load averages are included in the output of commands

$ uptime 
$ w
$ sar 
$ top

# It’s generally easiest and most efficient to access 
# values directly from the kernel (through sysctl or /proc) if you can

$ sysctl
$ proc


#-----------------------------------------------
### Nagios and Icinga
#-----------------------------------------------


# Monitoring platforms such as Nagios and Icinga include 
# a rich set of community-developed monitoring plug-ins 
# that you can use to get your hands on commonly monitored 
# elements. They, too, are often simply scripts that 
# run commands and parse the resulting output, but 
# they come already tested and debugged, 
# and they often work on multiple platforms. 
# If you can’t find a plug-in that yields the value 
# you’re interested in, you can write your own.


#--------------------------------------------------
### Cryptography Basics
#--------------------------------------------------


# UNIX and Linux System Administration Handbook. p2629.0

# Let's Encrypt 

# In 2016, Let’s Encrypt was launched as a free service that 
# issues certificates through an automated system.

# certificate authority

# You can create a CA with OpenSSL, import the CA’s 
# certificate to the trust store throughout your site, and 
# then issue certificates against that authority.

# Open SSL

# The OpenSSH project, for example, distributes PGP signatures 
# (which rely on cryptographic hash functions) of its 
# tarballs for verification. To verify the authenticity and 
# integrity of a download, you calculate the hash value of 
# the file you actually downloaded and compare it to the 
# published hash value, thus ensuring that you’ve received a
#  complete and unmolested copy with no bit errors.


#--------------------------------------------------
### fleets of virtualized instances
#--------------------------------------------------


# Modern tools such as collectd, sysdig, and dtrace offer a more scalable approach to collecting this type of data.

# Collection of system statistics should be a continuous process, and the UNIX solution to an ongoing task is to create a daemon to handle it. Enter collectd, the system statistics collection daemon.

# This popular and mature tool runs on both Linux and FreeBSD. Typically, collectd runs on the local system, collects metrics at specified intervals, and stores the resulting values. You can also configure collectd to run in client/server mode, where one or more collectd instances aggregate data from a group of other servers.


#--------------------------------------------------
### sysdig and dtrace: execution tracers
#--------------------------------------------------


# sysdig (Linux) and dtrace (BSD) comprehensively instrument both kernel and user process activity. They include components that are inserted into the kernel itself, exposing not only deep kernel parameters but also per-process system calls and other performance statistics. These tools are sometimes described as “Wireshark for the kernel and processes.”

# Both of these tools are complex. However, they are well worth tackling. A weekend spent learning either one will give you amazing new superpowers and ensure your status as an A-list guest on the sysadmin cocktail circuit.

### application monitoring

# To make sure you’re monitoring the right things, you need business units and developers to join the party and tell you more about their interests and concerns. If you have a web site that runs on the LAMP stack, for example, you’ll probably want to make sure you’re monitoring page load times, flagging critical PHP errors, keeping tabs on the MySQL database, and monitoring for specific issues such as excessive connection attempts.

# Although monitoring for this layer can be complex, this domain is also where monitoring gets sexy. Imagine monitoring (and pulling into your beautiful Grafana dashboard)


#--------------------------------------------------
### Logwatch & OSSEC: Log monitoring
#--------------------------------------------------


# In its most basic form, log monitoring involves grepping through log files to find interesting data you’d like to monitor, pulling out that data, and processing it into a form that’s usable for analysis, display, and alerting. Since log messages consist of free-form text, implementation of this pipeline can range in complexity from trivial to challenging.

# Logs are typically best managed with a comprehensive aggregation system designed for that purpose. We address such systems in the section Management of logs at scale. Although these systems focus primarily on centralizing log data and making it easy to search and review, most aggregation systems also support threshold, alarm, and reporting functionality.

# If you need automated log review for a few specific purposes and are reluctant to commit to a more general log management solution, we recommend a couple of smaller-scale tools: logwatch and OSSEC.

# logwatch isn’t designed for real-time monitoring

# OSSEC is promoted as a security tool, but its architecture is general enough that it’s useful for other kinds of monitoring as well


#--------------------------------------------------
### Munin and Supervisor
#--------------------------------------------------


# They’re easy to install, require little configuration, and work well together.

# Supervisor and its server process supervisord help you monitor processes and generate events or notifications when the processes exit or throw an exception. The system is similar in spirit to Upstart or to the process-management portions of systemd.

# Munin is a general monitoring platform with particular strengths in application monitoring. It’s written in Perl and requires an agent known as a Munin Node to be running on all the systems you want to monitor. Setting up a new Node is easy: just install the munin-node package, edit munin-node.conf to point to the master machine, and you’re good to go.

# It’s likely that you can find an existing plug-in that meets your needs. If not, it’s easy to write a new script for munin-node to execute.


#--------------------------------------------------
### Isolate containers with a user namespace
#--------------------------------------------------


# Linux namespaces provide isolation for running processes, limiting their access to system resources without the running process being aware of the limitations. 

# The best way to prevent privilege-escalation attacks from within a container is to configure your container’s applications to run as unprivileged users. For containers whose processes must run as the root user within the container, you can re-map this user to a less-privileged user on the Docker host. The mapped user is assigned a range of UIDs which function within the namespace as normal UIDs from 0 to 65536, but have no privileges on the host machine itself.


#--------------------------------------------------
### Remapping and subordinate user and group IDs
#--------------------------------------------------


# The remapping itself is handled by two files: /etc/subuid and /etc/subgid. Each file works the same, but one is concerned with the user ID range, and the other with the group ID range