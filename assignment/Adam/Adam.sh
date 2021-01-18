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

# add the upstream remote point
git remote add upstream https://github.com/joachimvandekerckhove/cogs-205b.git


#make a new branch
git checkout -b add-zhibin-assigment1

# witch to the new branch
git checkout add-zhibin-assigment1

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

# push the changes to Joachim's repo
git push upstream add-zhibin-assignment1
# this will prompt asking for username and passwork like below, and does not work
# Username for 'https://github.com': 
# Password for 'https://zhibinz2@github.com':
# remote: Permission to joachimvandekerckhove/cogs-205b.git denied to zhibinz2.
# fatal: unable to access 'https://github.com/joachimvandekerckhove/cogs-205b.git/': The requested URL returned error: 403

# push the changes to zhibin's fork instead create a pull request on Joachim's repo
git push origin add-zhibin-assignment1

