# Assignment 1: Github clone and push

# Define dir variables
GITNAME=brandonhackney # NO SPACE or else it thinks = is a function
HPCNAME=cable
BRANCHNAME=HPCNAME-assignment1

# ensure this posts back to Joachim's main
git remote add upstream https://github.com/joachimvandekerckhove/cogs-205b.git

# Clone class git repository and make a new branch
git clone git@github.com:$GITNAME/cogs-205b.git
cogs-205b #this makes the code cleaner, but is not preferable going forward.
git branch $HPCNAME-assignment1 # create new branch
git checkout $HPCNAME-assignment1 # switch to branch

# Make yourself a new directory in the class repository
mkdir assignment/$HPCNAME

# Copy this script into the new directory
cd
cp $HPCNAME.sh cogs-205b/assignment/$HPCNAME/

# Push update to git repository
cd cogs-205b
git add -A # Add all current changes to 'staging area'
git commit -m "Add $HPCNAME to assignment" # Label your changes
git push -u upstream $HPCNAME-assignment1 # Send changes to upstream (Joachim)
#git push -u origin $HPCNAME-assignment1 # send changes to local fork
