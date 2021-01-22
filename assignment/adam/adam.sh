pseudonym=adam
repodir=/data/homezvol1/zhibinz2/tmp/cogs-205b
mkdir $repodir
assndir=$repodir/assignment/$pseudonymadd
branchname=$pseudonym-new-branch

git config --global user.email "zhibinz2@uci.edu"
git config --global user.name "zhibin zhou"

$git clone git@github.com:zhibinz2/cogs-205b.git $repodir

# not working in cd
git -c $repodir/ remote add upstream git@github.com:joachimvandekerckhove/cogs-205b.git

git fetch upstream
git checkout main
git merge upstream/main

git -c $repodir/ branch $branchname
git -c $repodir/ checkout $branchname
#git -c $repodir/ checkout -b $branchname

git rebase main
git -c $assndir/ add .
git -c $assndir/ commit -m"add $pseudonym directory"
git -c $assndir/ push --set-upstream origin $branchname

#Did not show the pull request

