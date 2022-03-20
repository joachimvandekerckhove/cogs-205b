%% Final assignment <Angela>
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
% The model that fits better is the saturated model. The DIC of the
% saturated model is smaller than the DIC of the constrained model. I'm
% confused though because when I make plots (saturated.plot and
% constrained.plot), it appears that the constrained model fits better.
% When I run fitdist(data,'Weibull') for data = data.easy, data.medium, or
% data.hard, the parameters returned more closely match the ones in the
% constrained model. Sorry I messed up somewhere and I don't know where. 
% 
% The Scale parameter goes down from the "easy" to the "medium" condition,
% then goes up from the "medium" to the "hard" condition, for the saturated
% model.
% 
% The Shape parameter goes up from the "easy" to the "medium" condition,
% then goes down from the "hard" condition, for the saturated model. 
