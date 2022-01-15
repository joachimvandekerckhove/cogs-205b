PSEUDO=$gmauter
git clone git@github.com:garrettmauter/cogs-205b.git
git checkout -b week1
mkdir cogs-205b/assignment/$PSEUDO
cp gmauter.sh cogs-205b/assignment/$PSEUDO
git add $PSEUDO.sh
git commit -m 'commit-1'
git push --set-upstream origin week1


