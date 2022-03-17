%% Final assignment <Elle Giovanni>
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
% The model that fits better is the [constrained] model.
%
% The Scale parameter [goes down] from the "easy"
% to the "hard" condition. 
% Scale Slope Mean: -0.2179
%
% The Shape parameter [goes down] from the "easy"
% to the "hard" condition. 
% Shape Slope Mean: -0.2179
