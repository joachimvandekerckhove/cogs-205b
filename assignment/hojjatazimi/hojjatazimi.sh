name=hojjatazimi
dir=./assignment/$name
brnch=hojjat01
git clone https://github.com/hojjatazimi/cogs-205b.git #git@github.com:joachimvandekerckhove/cogs-205b.git
cd ./cogs-205b
git checkout -b $brnch
mkdir $dir
cp ../$name\.sh $dir\/$name\.sh

git add $dir\/$name\.sh
git commit -m "Mission Accomplished"
git push -u origin $brnch
