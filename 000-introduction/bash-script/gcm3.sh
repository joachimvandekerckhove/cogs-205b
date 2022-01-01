#!/bin/bash

WDIR=/tmp/joachim

# Install JAGS
./install-jags.sh "$WDIR"

# Install Trinity
./install-trinity.sh "$WDIR"

# Get MATLAB code and data
./download-gcm3.sh "$WDIR"


# Run the analysis

module load MATLAB

echo -n "! MATLAB...  "

PATH=$PATH:/tmp/joachim/jags/bin \
    matlab -nosplash -nodesktop -nojvm -batch \
    "addpath(genpath('$WDIR/trinity')); cd $WDIR/gcm3; gcm3_trinity;" \
    > $WDIR/gcm3.est

echo -e "\xE2\x9C\x94"

cat $WDIR/gcm3.est
