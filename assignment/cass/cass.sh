#!/bin/bash
#1. First clones the class git repository and makes a new branch
#2. Then makes a new directory /assignment/<your-pseudonym>/ in the git repository
#3. Makes a copy of itself in the new directory
#4. Pushes the updates to the git repository

x=cass

echo "clone and make a branch"

git clone git@github.com:cassfwolfe/cogs-205b.git

cd cogs-205b/
git checkout -b new-branch

echo "new directory /assignment/cass in the git repository"

mkdir ./assignment/$x

echo "make a copy"

cp ../$0 ./assignment/$x 

echo "push updates"
 
git add . 

git commit -m "please let this work"

git push --set-upstream origin new-branch


