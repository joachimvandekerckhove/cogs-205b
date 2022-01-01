#!/bin/bash

rm 400-integration/html/ -fr

matlab -batch "publish('integration_intro.m');"
matlab -batch "publish('quadrature_intro.m');"
matlab -batch "publish('monteCarlo_intro.m');"

matlab -batch "publish('integration_exercises');"
