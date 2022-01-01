#!/bin/bash

rm 300-optimization/html/ -fr

matlab -batch "publish('anonymousFunctions.m');"
matlab -batch "publish('nelderMead_intro.m');"
matlab -batch "publish('newtonRaphson_intro.m');"
matlab -batch "publish('hillClimber_intro.m');"
matlab -batch "publish('simulatedAnnealing_intro.m');"

matlab -batch "publish('optimizationExercises');"
