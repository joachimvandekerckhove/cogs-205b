%% Final assignment Adriana F. Chávez De la Peña
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
DIC_Comparison = saturated.DIC - constrained.DIC

%% Conclude
% The model that fits better is the constrained model.
%
% The Scale parameter goes up from the "easy" to the "hard" condition. 
[X,~,~] = constrained.CleanHistory;
Mean_X = mean(X,2);
scaleEasy = Mean_X(1)
scaleHard = Mean_X(1) + (2*Mean_X(2))
%
% The Shape parameter goes down from the "easy" to the "hard" condition. 
shapeEasy = Mean_X(3)
shapeHard = Mean_X(3) + (2*Mean_X(4))