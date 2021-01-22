#get rid of the [zhibinz2@login-i15:~/cogs-205b] in the command line
PS1='$' 

# clone the fork repo to the cluster
git clone git@github.com:zhibinz2/cogs-205b.git

# move into the repo directory
cd cogs-205b/

# each time when I begin to work on the project
git  checkout main
git fetch --all --prune
git rebase

#make a new branch
git checkout -b add-zhibin-assigment1

# move into the assignment directory
cd assignment/

# Adam is the pseudoname for Zhibin
# make the directory of Adam and move into that directory
pseudonym=Adam
mkdir $pseudonym
cd $pseudonym/

# create the bash script file and edit it
touch $pseudonym.sh
nano $pseudonym.sh

# add all the changes
git add .

# check the stage status
git status

# commit the changes
git commit -a -m "add the edited bash script and ready to push"

# push the changes to zhibin's fork
git push -u origin add-zhibin-assignment1
