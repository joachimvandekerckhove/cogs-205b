%% Final assignment <Isaac>
clear
clc

%% Get data
data = final.getFinalData();

%% Saturated model first
saturatedTarget = @(parameter) final.SaturatedLogPosterior(parameter, data); % <-- edit as needed
saturated = final.Metropolis(saturatedTarget, [2 2 2 2 2 2]');
saturated.DrawSamples(10000)
saturated.disp

% plot the updates:
saturated.plotMetrop("Saturated");
%% Constrained model next
constrainedTarget = @(parameter) final.ConstrainedLogPosterior(parameter, data); % <-- edit as needed
constrained = final.Metropolis(constrainedTarget, [2 0 2 0]');
constrained.DrawSamples(10000)
constrained.disp

% plot the updates:
constrained.plotMetrop("Constrained");
%% Compare the two models
disp(saturated.DIC - constrained.DIC);

%% Conclude
% The model that fits better is the [constrained] model.
%
% For the Constrained Model, using the mean values from
% the Metropolis.disp output:
%
% The Scale parameter [goes down] from the "easy"
% to the "hard" condition. 
% The Shape parameter [goes down] from the "easy"
% to the "hard" condition. 
