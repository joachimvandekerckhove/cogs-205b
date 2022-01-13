#!/bin/bash
# Assignment 1.

pseudonym="isaacmenchaca"
shPATH=$PWD

# git clone the repository.
git clone git@github.com:$pseudonym/cogs-205b.git

# change directory into the project.
cd cogs-205b/

# make a new branch.
git checkout -b assignment1-branch

# check status (for testing only)
git status

# make a new directory with pseudonym
mkdir ./assignment/$pseudonym/

# make copy of current script. move it to the new directory.
cp $shPATH/$pseudonym.sh ./assignment/$pseudonym/

# add all changes and new files
git add .

# commit changes
git commit -m "submitting assignment 1. - push attempt 1"

# recheck status
git status

# push
git push --set-upstream origin assignment1-branch

