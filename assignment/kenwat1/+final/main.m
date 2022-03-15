%% Final assignment <kenwat1>
clear
clc

%% Get data
data = final.getFinalData();

%% Saturated model first
saturatedTarget = @(parameter) final.SaturatedLogPosterior(parameter,data);
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
disp(['The difference in DIC is: ', num2str(DIC_diff)]);
% if < 0, then saturated is better
% if > 0, then constrained is better

%% Conclude
% The model that fits better is the "constrained" model because DIC is
% positive.
%
% The Scale parameter "goes up" from the "easy" to the "hard" condition.
%
% The Shape parameter "goes up" from the "easy" to the "hard" condition.
