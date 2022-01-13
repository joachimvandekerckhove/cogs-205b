#!/bin/sh
 
pseudonym=lemontgomery2

git clone git@github.com:$pseudonym/cogs-205b.git
git -C cogs-205b/ checkout -b homework-assignment
mkdir cogs-205b/assignment/$pseudonym/
cp $pseudonym.sh ./cogs-205b/assignment/$pseudonym
git -C cogs-205b/ add .
git -C cogs-205b/ commit -m "Homework Assignment 1 - creating shell script"
git -C cogs-205b/ push --set-upstream origin homework-assignment