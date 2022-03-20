%% Final assignment <your name>
clear
clc

%% Get data
data = final.getFinalData();

%% Saturated model first
fprintf('Now running Saturated model:\n')
saturatedTarget = @(parameter) final.SaturatedLogPosterior(parameter, data); 
saturated = final.Metropolis(saturatedTarget, [2 2 2 2 2 2]');
saturated.DrawSamples(10000)
saturated.disp
                                                                                                                                                                      
%% Constrained model next  
fprintf('Now running Constrained model:\n')
constrainedTarget = @(parameter) final.ConstrainedLogPosterior(parameter, data); 
constrained = final.Metropolis(constrainedTarget, [2 0 2 0]');
constrained.DrawSamples(10000)
constrained.disp

%% Compare the two models
fprintf('Now getting the value(saturated DIC - constrained DIC):\n')
saturated.DIC - constrained.DIC

%% Conclude
%{
The model that fits better is the [constrained] model.

The Scale parameter [goes up] from the "easy" to the "hard" condition.

The Shape parameter [goes up] from the "easy" to the "hard" condition.
%}
