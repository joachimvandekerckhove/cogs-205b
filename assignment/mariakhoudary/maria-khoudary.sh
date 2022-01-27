#!/bin/bash
PSEUDONYM='maria-khoudary'
SOURCEDIR=$PWD
cd Winter_2022
git clone https://github.com/maria-khoudary/cogs-205b.git
cd cogs-205b
git checkout -b assignment1
cd assignment
mkdir $PSEUDONYM
cp $SOURCEDIR/$PSEUDONYM.sh $PSEUDONYM
git add $PSEUDONYM/
git commit -m 'execute assignment 1'
git push --set-upstream origin assignment1
