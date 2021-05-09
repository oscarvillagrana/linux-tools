### Github Terminal

# switches to older commit by id f97fceba
# carrot is to signify the one before selected
git rebase --interactive 'f97fceba^'

# selected fixup to detach master and start a new branch

git commit --amend --author "Oscar Villagrana <oscarvillagrana@github.com>"

# returns to head
git rebase --continue


# changes the author and email of the most recent commit
# This will change the author to the name specified, but the committer will be set to your configured user in git config user.name and git config user.email

git commit --amend --author "New Author Name <email@address.com>"

# updates paths from index incase files where erased in folder
git checkout .


#----------------------------------------------------
### Updating url location of a Repository
#----------------------------------------------------

# had to update url
git remote set-url origin https://github.com/oscarvillagrana/linux-toolbox.git


#-----------------------------------------------------
### Initializing a Repository in an Existing Directory
#-----------------------------------------------------

# connects to created repository in github.com
git remote add origin https://github.com/oscarevolves/agile-scrum-101.git

# will erase upstream branch!
git push --set-upstream origin master


# first change working directory to project's directory
cd ~/Desktop/Projects/Linux-Terminal-toolbox

# creates readme.md and index.html file
touch README.md
touch index.html

# creates subdirectory .git repository skeleton in working directory
git init

# logs into 'Oscar Villagrana' account
git config --global user.name 'Oscar'
git config --global user.email '@email.com'

#add file to be committed
git add index.html

#list changes to be made
git status

#moves file to Untracked files
git rm --cached index.html

#add all files ending in .html
git add *.html

#adds all files in branch master
git add .

#long commit version

#launches txt editor and once closed gets commited
git commit

#quick commit version
git add .
git commit -m 'Changed Readme.txt'

#creates file with list of ignored files & folders
touch .gitignore


######################################################
#
### Working with Remotes.Pro Git.p 106
#
######################################################


# shows which remote servers you have configured
$ git remote

# shows the URLs that Git stored or list all remotes
$ git remote -v

# Adds a new remote Git repository as a shortname you can reference easily
# git remote add <shortname> <url>
$ git remote add origin https://github.com/oscar/Linus-Terminal-Toolbox.git

# pushes project upstream
# git push <remote> <branch>
$ git push origin master

# push will be rejected if you haven't fetched the latest version

# shows more information about a particular remote
# git remote show <remote>
$ git remote show origin

# renames remote from origin to asus
# git remote rename <original_name> <new_name>
$ git remote rename origin asus

# shows remote name
$ git remote

# changed the url so I updated the remote

$ git remote set-url origin https://github.com/oscarevolves/Bash-Basics-Terminal-Toolbox


#----------
### Tagging
#----------


# creates a lightweight tag by not using -a, -s, or -m options
$ git tag v0.1

# lists existing tags
$ git tag
$ git tag -l

# searches for tags only within the 1.8.5 series
$ git tag -l "v1.8.5*"

# shows entire log of commits
$ git log

# shows the full detail of changes in the version
$ git show v0.1

# annotated tags are stored as full checksummed objects in the Git database

# -m option --specifies tagging message
# creates an annotated tag
$ git tag -a v0.2 -m "my version 0.2"

# shows commit history in a pretty format
$ git log --pretty=oneline

# tag commits using their checksum --or a part of it
$ git tag -a v0.0 fe399 -m "annotating a tag later"

# to push tags to a shared server
# git push <remote> <tagname>
$ git push asus v0.1

# tranfers all of the tags to remote server
$ git push asus --tags
# --tags option pushes both lightweight and annotated tags

# delete tag on local repository
# git tag -d <tagname>
$ git tag -d v0.01

# delete tag from remote server
# git push <remote> :refs/tags/<tagname>
$ git push asus :refs/tags/v0.0

# delete tag from remote server
# git push asus --delete v0.0

### "detached HEAD" state
# views the versions of files a tag is pointing to
# git checkout
$ git checkout 0.0


#------------
### Branching
#------------


$ git push
fatal: The current branch master has no upstream branch.
To push the current branch and set the remote as upstream, use

    git push --set-upstream origin master


#----------
### Merging
#----------


# creates new branch and switches to the new branch 'iss53'
$ git checkout -b iss53

# push the current branch and set the remote as upstream, use
$ git push --set-upstream origin v0.1


# I needed to merge unrelated histories

$ git merge --allow-unrelated-histories
$ git push origin HEAD:master



### Stash

# want remove all local changes from your working copy with stash
$ git stash save --keep-index

# If you don't need them anymore, you now can drop that stash:
$ git stash drop


### Staging

# unstage
$ git reset HEAD <file>

### Clone

#creates entire folder of anybodys public project
git clone https://github.com/oscarevillagrana/MusBiz.git

#gets up to date files
git pull

# creates but does not switch to
git branch newbranch

# shoes destination of fetch and push
git remote -v

### Configuration - Customizing Git.Pro Git.p 662

# list your settings at that point

$ git config --list

# /ect/gitconfig - git config files can be found in the system-wide ect folder

# reads and writes from /ect/gitconfig file

$ git config --system

# changed user email config for privacy error

git config --global user.email "526473+gb96@users.noreply.github.com"
git rebase -i
git commit --amend --reset-author
git rebase --continue
git push

### Attributes - Git Attributes.Pro Git.p 686



How to move files from one git repo to another (not a clone), preserving history
Ask Question
412

Our Git repositories started out as parts of a single monster SVN repository where the individual projects each had their own tree like so:

project1/branches
        /tags
        /trunk
project2/branches
        /tags
        /trunk

Obviously, it was pretty easy to move files from one to another with svn mv. But in Git, each project is in its own repository, and today I was asked to move a subdirectory from project2 to project1. I did something like this:

$ git clone project2 
$ cd project2
$ git filter-branch --subdirectory-filter deeply/buried/java/source/directory/A -- --all
$ git remote rm origin  # so I don't accidentally the repo ;-)
$ mkdir -p deeply/buried/different/java/source/directory/B
$ for f in *.java; do 
>  git mv $f deeply/buried/different/java/source/directory/B
>  done
$ git commit -m "moved files to new subdirectory"
$ cd ..
$
$ git clone project1
$ cd project1
$ git remote add p2 ../project2
$ git fetch p2
$ git branch p2 remotes/p2/master
$ git merge p2 # --allow-unrelated-histories for git 2.9
$ git remote rm p2
$ git push

