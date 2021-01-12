# Assignment 1: Github clone and push

GITNAME=brandonhackney # NO SPACE or else it thinks = is a function
HPCNAME=cable

# Clone class git repository and make a new branch
git clone git@github.com:$GITNAME/cogs-205b.git
cd cogs-205b
git branch $HPCNAME # create new branch
git checkout $HPCNAME # switch to branch

# Make yourself a new directory in the class repository
mkdir assignment/$HPCNAME

# Copy this script into the new directory
cd
cp $HPCNAME.sh cogs-205b/assignment/$HPCNAME/

# Push update to git repository
cd cogs-205b
# git checkout master
# git merge $HPCNAME
git add -A # Add all current changes to 'staging area'
git commit -m "Add $HPCNAME to assignment" # Label your changes
# git pull origin master # get any changes to online files since last pull
git push -u origin $HPCNAME # update online files to match local changes

