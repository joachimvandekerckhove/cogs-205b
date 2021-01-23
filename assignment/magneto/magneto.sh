#!/bin/bash

##
##  This script performs a simple github workflow
##
##  (c) 2021 Joachim Vandekerckhove
##


### Make some local variables
PSEUDONYM=magneto
REPODIR=/tmp/cogs-205b
ASSNDIR=$REPODIR/assignment/$PSEUDONYM
BRANCHNAME=$PSEUDONYM-new-branch
## Difficulty: your pseudonym appears in script only once


### Set up your local git install
## You have to set up your identity once
# git config --global user.email "joachim.vandekerckhove@gmail.com"
# git config --global user.name "Joachim Vandekerckhove"


### Set up the git repository
## First clone the class git repository
git clone git@github.com:joachim-student/cogs-205b.git $REPODIR

## Tell git what the upstream repository is
git -C $REPODIR/ remote add upstream git@github.com:joachimvandekerckhove/cogs-205b.git

## If your local repository is not up to date, update it
# git fetch upstream
# git checkout master
# git merge upstream/master
## Note that this does not destroy your local changes

## Make a new branch and switch to it
git -C $REPODIR/ branch $BRANCHNAME
git -C $REPODIR/ checkout $BRANCHNAME
# git -C $REPODIR/ checkout -b $BRANCHNAME


### Make changes to the repository
## Then make a new directory /assignment/magneto/ in the git repository
mkdir $ASSNDIR/

## Make a copy of itself in the new directory
cp $0 $ASSNDIR/


### Push the changes out
## If you made changes over a long period, merging before committing helps avoid conflicts
# git fetch upstream
# git checkout master
# git merge upstream/master
# git checkout $BRANCHNAME
# git rebase master

## Push the updates to the git repository
git -C $ASSNDIR/ add .
git -C $ASSNDIR/ commit -m "Add $PSEUDONYM directory"
git -C $ASSNDIR/ push --set-upstream origin $BRANCHNAME


## This should print something like this:
##
##   remote: Create a pull request for 'magneto-new-branch' on GitHub by visiting:
##   remote:      https://github.com/joachim-student/cogs-205b/pull/new/magneto-new-branch
##   remote:
##   To github.com:joachim-student/cogs-205b.git
##    * [new branch]      magneto-new-branch -> magneto-new-branch
##   Branch 'magneto-new-branch' set up to track remote branch 'magneto-new-branch' from 'origin'.
##
## Follow the link to open a pull request
