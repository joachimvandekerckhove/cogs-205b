#!/bin/bash

WDIR="$1"

######
# Install Trinity
######

echo -n "! Trinity"

if [ ! -d $WDIR/trinity ]
then
    echo -n "... "
    mkdir "$WDIR/trinity"
    git clone https://github.com/joachimvandekerckhove/trinity.git $WDIR/trinity --quiet
    echo -e "\xE2\x9C\x94"
else
    echo -e "    \xE2\x9C\x94"
fi
