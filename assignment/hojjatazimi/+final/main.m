%% Final assignment <Hojjat Azimi Asrari>
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
% The model that fits better is the saturated model. Because it's DIC is
% smaller.
%
% The Scale parameter remains constant from the "easy"
% to the "hard" condition. 
%
% The Shape parameter remains constant from the "easy"
% to the "hard" condition. 
