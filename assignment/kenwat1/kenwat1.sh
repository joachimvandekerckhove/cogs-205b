#!/bin/bash
pseudo="kenwat1"
course="cogs-205b"

git config --global user.email "kentaw1@uci.edu"
git config --global user.name "kenwat1"

git clone git@github.com:kenwat1/$course.git
# clones the class git repos

cd $course/

git checkout -b new-edits
# make a new branch

mkdir assignment/$pseudo/
# make a directory in the git repos
cd
cp $pseudo.sh $course/assignment/$pseudo/
# copy itself into the new directory

cd $course/
git add .
git -a -m "Small change"
git commit -a -m "Tiny change"

git push --set-upstream origin new-edits
# push to update
