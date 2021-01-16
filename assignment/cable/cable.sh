#!/bin/bash
# Assignment 1: Github clone and push

# Define dir variables
GITNAME=brandonhackney # NO SPACE or else it thinks = is a function
HPCNAME=cable
BRANCHNAME=$HPCNAME-assignment1
REPONAME=cogs-205b

# Define upstream (even if it's not used here)
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ remote add upstream https://github.com/joachimvandekerckhove/$REPONAME.git

# Clone my fork of class git repository and make a new branch
if [ ! -d "$REPONAME" ]; then
  git clone git@github.com:$GITNAME/$REPONAME.git
else
  git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ fetch --all
fi
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ branch $BRANCHNAME # create new branch
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ checkout $BRANCHNAME # switch to branch

# Make yourself a new directory in the class repository
COPYDIR=$REPONAME/assignment/$HPCNAME
if [ ! -d "$COPYDIR" ]; then
  mkdir $COPYDIR
fi

# Copy this script into the new directory
#cp $HPCNAME.sh $COPYDIR/ #lazy way
cp "$(basename $0)" $COPYDIR/ #better way (just using $0 will give "./name" instead of "name")

# Push update to git repository
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ add -A # Add all current changes to 'staging area'
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ commit -m "Fix define upstream" # Label your changes
git --git-dir=$REPONAME/.git --work-tree=$REPONAME/ push -u origin $BRANCHNAME # send changes to local fork
# Will have to manually submit a pull request

