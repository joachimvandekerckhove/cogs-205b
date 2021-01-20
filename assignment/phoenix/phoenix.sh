#!/bin/bash

pseudo=phoenix
#tree="git --git-dir=cogs-205b/.git --work-tree=cogs-205b/"

echo "Clone Repo & navigate to it"
git clone git@github.com:nb2499/cogs-205b.git
cd cogs-205b/

echo "Cloned. Check out branch"
git checkout -b hw1

echo "Set upstream to main"
git remote add upstream https://github.com/joachimvandekerckhove/cogs-205b.git

echo "Make directory"
mkdir assignment/$pseudo

echo "Directory made. Copy shell file"
cp -v ../$0 assignment/$pseudo/

echo "File copied. Add file"
git add assignment/$pseudo/$0

git status

echo "File added. Commit"
git commit -m "Homework 1"

echo "File committed. Push"
git push --set-upstream origin hw1

echo "#### SCRIPT END ####"


