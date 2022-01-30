
#!/bin/bash

thisWD=$(pwd)
Yo="adri"
branch="assignment-1"

echo "------------"
echo "Cloning forked repository..."
echo "------------"
cd 
cd Downloads/
git clone https://github.com/Adrifelcha/cogs-205b.git
git -C cogs-205b/ checkout -b $branch
mkdir cogs-205b/assignment/$Yo

cp -a $thisWD cogs-205b/assignment/$Yo
echo
echo "-------------"
echo "A new branch has been open, an folder for this assignment was created and this .sh file has been copied..."
echo "Now we checked for untracked changes with -git status-"
echo "-------------"
echo 
git -C cogs-205b/ status
echo
echo "--------------"
echo "We add and commit these changes with -git add- and -git commit-"
echo "--------------"
echo
git -C cogs-205b/ add .
git -C cogs-205b/ commit -m "Commiting my first assignment"
echo
echo "--------------"
echo "Finally, we push these changes!"
echo "--------------"
echo
git -C cogs-205b/ push --set-upstream origin $branch
