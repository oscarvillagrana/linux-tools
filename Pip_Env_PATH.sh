### Python Pip and Virtualenv

# pip is a package manager

# brings up all the commands you can use
$ pip help

# brings up the options for the install command
$ pip help install

# finds a package name and description without having to type it's exact name
# pip search Pympler

# installs package
$ pip install Pymple

# lists installed packages with version number
$ pip list

# uninstalls package
$ pip uninstall Pympler

# shows the current and latest version 
$ pip list --outdated  # aka $ pip list -o

# upgrades package
$ pip install -U setputools

# outputs all of our packages and version numbers in a requirements format
$ pip freeze

# pipes it out to a txt file
$ pip freeze > requirements.txt
$ cat requirements.txt 		# to check it worked

# uses the requirements file 'r_test.txt'
$ pip install -r r_test.txt
$ pip list 					# checks installed packages

# shows current versions and available updates
$ pip list --outdated

# pip freeze outputs all of the requirements
# tactic (--) local if in global environment print out local packages
# grep skips package definitions
# cut sets the delimiter to an equal sign (cuts after the equal sign)
# xargs only returns the first argument

$ pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U

# you can breakdown this command and see its outputs
$ pip freeze --local | grep -v '^\-e'

$ pip freeze --local | grep -v '^\-e' | cut -d = -f 1

# checks that we should not have any programs outdated 
$ pip list --outdated


#
### Virtualenv
#


# creates new environment
$ virtualenv project1_env

# activates environment 
$ source project1_env/bin/activate

# shows the path to the python we are running 
$ which Python

# shows the path to the pip we are running
$ which pip

# shows we don't have the global packed site packages
$ pip list

# install a few packages
$ pip install numpy
$ pip install pytz

$ pip list

# export packages and their version numbers
# tack tack (--) allows you to use your global site packages within a virtual python env

# takes only the local dependencies that you had in you python environment and outputs to a requirements txt file
$ pip freeze --local > requirements.txt

# check we have all of our packages
$ cat requirements.txt

# gets out of the environment
$ deactivate

# shows global env python path
$ which python

# shows global site packages
$ pip list

# in /Environments removes file
$ rm -rf project1_env/

# shows remaining files in /Environments directory
$ ls

# specifies a specific version of python to use
$ virtualenv -p /usr/bin/python2.6 py26_env # last command is the project name

# it was greated in /Environments
$ ls

# activate
$ source py26_env/bin/activate

# check you are in the correct bin/python
$ which python

# check the version too
$ python --version

# installs a list of previous packages in the requirements.txt
$ pip install -r requirements.txt

# shows installed packages and versions
$ pip list

$ deactivate

## you wouldn't build you project files within you virtual env because you want to be able to throw them away whenever you want
## intended to seperate out the packages dependencies and the versions you are going to use from project to project

#
### Setting the PATH for Ubuntu
#


# to check if you have Python and it’s available from your command line
$ python --version

# to make sure you have pip available
$ pip --version

# Pipenv is a dependency manager for Python projects
# to install Pipenv
$ pip install --user pipenv

# you’ll need to add the user base’s binary directory to your PATH If pipenv isn’t available in your shell after installation
# the bin (short for binary) directory is a list of all the files needed to make your linux system work
# e.g. of bin files: commands copy and ls

# find the user base binary directory by running 
python -m site --user-base #and adding bin to the end


#
### How to set the Path and Switch between different versions/executables
#


# which command will tell you where the actual location of the program is
$ which python3

# type command will work for both alliases and commands
$ type python3

# a path environment variable is where your machine looks for its commands in a specific order

# this gives us the current path and each directory is seperated by a colon
$ echo $PATH

#
### to adding a directory to your path
#

# within home folder
# opens text file that contains path instructions using nano editor
$ nano .bashrc


# setting PATH for pipenv
PATH="/usr/sbin:/usr/bin:${PATH}"

# setting PATH for anaconda
PATH="/usr/home/anaconda3/sbin:/usr/home/anaconda3/bin:/usr/sbin:/usr/bin:${PATH}"

# set path to this new variable
export PATH

# to prioritize commands
# creates an alias to change python3 command to python

## to check running one python command instead of another
# the sys module built in i.e. it is in the standard library
$ import sys

# finds where our current executable is located i.e. which python executable is running
$ sys.executable

# gives information on the package 'Django'
$ pip show django

# path environment issues include
# installed package must go into site-packages directory in the correct version of python

# sublime uses build systems which is quite different 

#
### Pipenv
#

# installed 'request' package in /Programming-Guide environment

# stoped Schafer.Pipenv at (6:36) 

# activates virtualenv
$ pipenv shell

# pipfile uses a format called TOML, a minimal design that contains keys and values 