# this is angela's first shell script yay
# when run, it does the following:
# 1. clones the class git repository and make a new branch
# 2. makes a new directory called /assignment/angela/ in the git repository
# 3. makes a copy of itself in the new directory
# 4. pushes the updates to the git repository

PSEUDONYM=angela

#!/bin/bash

echo "cloning class git repository"
git clone git@github.com:angelaashen/cogs-205b.git

echo "making a new branch"
git -C cogs-205b/ checkout -b mybranch

echo "making a new directory"
mkdir  ./cogs-205b/assignment/$PSEUDONYM

echo "copying this file to the directory"
cp $0 ./cogs-205b/assignment/$PSEUDONYM

echo "push updates to class git repo"
git -C cogs-205b/ add .
git -C cogs-205b/ commit -a -m "first commit! hope this works!"
git -C cogs-205b/ push --set-upstream origin mybranch
