#!/bin/bash

pseudo=phoenix
#alias gitc="git --git-dir=cogs-205b/.git --work-tree=cogs-205b/" 
#tree = "git --git-dir=cogs-205b/.git --work-tree=cogs-205b/"

echo "Clone Repo & Navigate to it"
git clone git@github.com:nb2499/cogs-205b.git
cd cogs-205b/

echo "Cloned. Now Checking out branch"
git checkout -b hw1

echo "Branch checked out. Now making directory"
mkdir assignment/$pseudo

echo "Set upstream to main"
git remote add upstream https://github.com/joachimvandekerckhove/cogs-205b.git

echo "Directory made now copying shell file"
cp -v ../$0 assignment/$pseudo/

echo "File copied. Now add file"
git add assignment/$pseudo/$0

git status

echo "File added now committing"
git commit -m "Homework 1"

echo "File committed, now pushing"
#git push origin hw1
git push --set-upstream origin hw1

echo "File run successfully"


