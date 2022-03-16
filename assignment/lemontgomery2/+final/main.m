%% Final assignment Lauren Montgomery (lemontgomery2)
clear
clc

%% Get data
data = final.getFinalData();

%% Saturated model first
saturatedTarget = @(parameter) final.SaturatedLogPosterior(parameter, data); 
saturated = final.Metropolis(saturatedTarget, [2 2 2 2 2 2]');
saturated.DrawSamples(10000)
saturated.disp

%% Constrained model next
constrainedTarget = @(parameter) final.ConstrainedLogPosterior(parameter, data);
constrained = final.Metropolis(constrainedTarget, [2 0 2 0]');
constrained.DrawSamples(10000)
constrained.disp

%% Compare the two models
saturated.DIC - constrained.DIC

%% Conclude
% The model that fits better is the [constrained] model.
%
% The Scale parameter [goes up] from the "easy" to the "hard" condition. 
%
% The Shape parameter [goes down] from the "easy" to the "hard" condition. 
% Between the "easy" and "medium" conditions, the parameter decreases.
% Between the "medium" and "hard" conditions, the parameter increases
% slightly. But overall, the parameter decreases across the conditions.
%