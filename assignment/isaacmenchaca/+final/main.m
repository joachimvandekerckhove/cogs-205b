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
saturated.plotMetrop("Saturated", {'Ae', 'Am', 'Ah', 'Be', 'Bm', 'Bh'}, ...
    'northeast');
%% Constrained model next
constrainedTarget = @(parameter) final.ConstrainedLogPosterior(parameter, data); % <-- edit as needed
constrained = final.Metropolis(constrainedTarget, [2 0 2 0]');
constrained.DrawSamples(10000)
constrained.disp

% plot the updates:
constrained.plotMetrop("Constrained", {'B0A', 'B1A', 'B0B', 'B1B'}, ...
    'east');
%% Compare the two models
disp(saturated.DIC - constrained.DIC);
% the difference is positive, meaning constrained model is better.

%% Conclude
% The model that fits better is the [constrained] model.
%
% For the Constrained Model, using the mean values from
% the Metropolis.disp output:
% (1): The Scale parameter [goes down] from the "easy"
% to the "hard" condition. 
% Ae = 2.410, Am = 2.410 - 0.809, Ah = 2.410 - 2(0.809)
%
% (2): The Shape parameter [goes down] from the "easy"
% to the "hard" condition. 
% Be = 2.792, Bm = 2.792 - 0.105, Bh = 2.792 - 2(0.105)
