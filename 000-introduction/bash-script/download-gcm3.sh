#!/bin/bash

WDIR="$1"


# Get MATLAB code and data

echo -n "! GCM3"

if [ ! -d "$WDIR/gcm3" ]     
then
    echo -n "...    "
    mkdir "$WDIR/gcm3"
    git clone https://github.com/joachimvandekerckhove/gcm3.git $WDIR/gcm3 --quiet
    echo -e "\xE2\x9C\x94"
else
    cd "$WDIR/gcm3" && \
    git fetch --all --prune --quiet
    echo -e "       \xE2\x9C\x94"
fi
