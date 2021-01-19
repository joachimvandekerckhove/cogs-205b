git clone git@github.com:ManuelVU/cogs-205b.git
cd cogs-205b
git remote add upstream https://github.com/joachimvandekerckhove/cogs-205b.git
psudonym=deadpool
filename=$psudonym".sh"
git branch assignment1
mkdir assignment/$psudonym
cd -
cp $filename cogs-205b/assignment/$psudonym
cd cogs-205b
git add .
git commit -m "assignment 1"
git push origin main
