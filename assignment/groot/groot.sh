#! /bin/bash

PSEUDONYM='groot'

# clone the class git repo
git -C $(PWD) clone git@github.com:doreenhii/cogs-205b.git 

# makes new branch 
git -C $(PWD)/cogs-205b checkout -b upload_assignment

# makes a new directory in git repo
mkdir $(PWD)/cogs-205b/assignment/$PSEUDONYM 

# makes a copy of this file in the new directory 
cp $0 $(PWD)/cogs-205b/assignment/$PSEUDONYM

# push 
git -C $(PWD)/cogs-205b add .
git -C $(PWD)/cogs-205b commit -a -m "Adding groot.sh"
git push --set-upstream origin upload_assignment

