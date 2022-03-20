%% Final assignment Garrett
% This is my solution to the final assignment for COGS 205: Computational Lab Skills
clear
clc

%% Get data
data = final.getFinalData();

%% Saturated model first
saturatedTarget = @(parameter) final.SaturatedLogPosterior(parameter, data); % <-- edit as needed
saturated = final.Metropolis(saturatedTarget, [2 2 2 2 2 2]');
saturated.DrawSamples(10000)
saturated.disp

%% Constrained model next
constrainedTarget = @(parameter) final.ConstrainedLogPosterior(parameter, data); % <-- edit as needed
constrained = final.Metropolis(constrainedTarget, [2 0 2 0]');
constrained.DrawSamples(10000)
constrained.disp

%% Compare the two models
saturated.DIC - constrained.DIC

%% Conclude
% The model that fits better is the constrained model (positive difference b/t saturated and constrained).
%
% The Scale parameter goes up from the "easy"
% to the "hard" condition (scale slope is positive). 
%
% The Shape parameter goes down from the "easy"
% to the "hard" condition (shape slope is negative). 
