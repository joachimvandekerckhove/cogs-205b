#!/bin/bash

MyName="JieWanHW1"

git config --global user.email "wj.jiewan@gmail.com"
git config --global user.name "JieWan21"

git clone git@github.com:JieWan21/cogs-205b.git

git -C cogs-205b/ checkout -b new-edits

mkdir cogs-205b/assignment/$MyName/

cp $MyName.sh cogs-205b/assignment/$MyName/

git -C cogs-205b/ add .
git -C cogs-205b/ commit -a -m "small change"
git -C cogs-205b/ push --set-upstream origin new-edits

