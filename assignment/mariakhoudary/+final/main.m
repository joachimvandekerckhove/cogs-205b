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
disp(DIC_diff)

%% Conclude
% The model that fits better is the Constrained model, by a DIC difference
% = 2.1369e+03.
%
% The Scale parameter goes up from the "easy" (0.817)
% to the "hard" (0.817 + 2*0.822 = 2.461) condition. 
%
% The Shape parameter godes down from the "easy" (3.482)
% to the "hard" (3.482 + 2*-0.588 = 2.306)  condition. 
