#!/bin/bash

WDIR=$1

echo -n "! JAGS"

if [ ! -d $WDIR/jags/libexec ] 
then
    ######
    # Install JAGS
    ######

    echo -n "...    "

    mkdir -p $WDIR/jags
    cd $WDIR

    wget -q https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.0.tar.gz -O - | tar -xzvf - > /dev/null
    cd JAGS-4.3.0

    LDFLAGS="-L$WDIR/jags/lib64" ./configure --prefix=$WDIR/jags --with-blas=-lblas --with-lapack=-llapack > /dev/null

    make > /dev/null
    make install > /dev/null

    echo -e "\xE2\x9C\x94"
else
    echo -e "       \xE2\x9C\x94"
fi
