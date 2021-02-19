#!/bin/bash

rm html/ -fr

matlab -batch "publish('integration_intro.m');"
matlab -batch "publish('quadrature_intro.m');"
matlab -batch "publish('monteCarlo_intro.m');"

matlab -batch "publish('integration_exercises');"

google-chrome html/*.html

pdflatex metropolis-hastings
pdflatex metropolis-hastings
