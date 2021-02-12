#!/bin/bash

rm html/ -fr

matlab -batch "publish('anonymousFunctions.m');"
matlab -batch "publish('nelderMead_intro.m');"
matlab -batch "publish('newtonRaphson_intro.m');"
matlab -batch "publish('hillClimber_intro.m');"
matlab -batch "publish('simulatedAnnealing_intro.m');"

matlab -batch "publish('optimizationExercises', 'showCode', false);"

google-chrome html/*.html
