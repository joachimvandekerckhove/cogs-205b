%% Final assignment - Maria Khoudary
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
DIC_diff = saturated.DIC - constrained.DIC;

%% Conclude
% The model that fits better is the Constrained model.
%
% The Scale parameter [goes up|goes down|remains constant] from the "easy"
% to the "hard" condition. 
%
% The Shape parameter [goes up|goes down|remains constant] from the "easy"
% to the "hard" condition. 
