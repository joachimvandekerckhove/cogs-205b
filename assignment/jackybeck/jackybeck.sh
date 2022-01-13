#!/bin/bash
#Assignment1

git config --global user.email "beckj2@uci.edu"
git config --global user.name "jackybeck"

pseudo=jackybeck

git clone git@github.com:$pseudo/cogs-205b.git

cd cogs-205b/
git checkout -b week1
git add .
cd assignment
mkdir $pseudo/
cd ../../
cp $pseudo.sh cogs-205b/assignment/$pseudo
cd cogs-205b/
git commit -a -m "week 1 assignment"
git push --set-upstream origin week1

