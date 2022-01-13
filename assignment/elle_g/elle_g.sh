git clone https://github.com/joachimvandekerckhove/cogs-205b.git
git branch branchofelle
git push -u origin branchofelle
git checkout branchofelle
cd assignment
mkdir elle_g
cd ..
cp elle_g.sh assignment/elle_g
cd assignment/elle_g
git add elle_g.sh
git commit -m "unix assignment, push update to git repo"
git push
