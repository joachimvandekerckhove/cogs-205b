function logPosterior = SaturatedLogPosterior(parameter,data)
%SATURATEDLOGPOSTERIOR Defines the log posterior for the saturated model
%defined in the Metropolis assignment PDF

% define parameters
a_e = parameter(1);
a_m = parameter(2);
a_h = parameter(3);
b_e = parameter(4);
b_m = parameter(5);
b_h = parameter(6);

% get loglikelihood for each condition
logLik_e = -wbllike([a_e, b_e], data.easy);
logLik_m = -wbllike([a_m, b_m], data.medium);
logLik_h = -wbllike([a_h, b_h], data.hard);
logLik = logLik_e + logLik_m + logLik_h; % multiplicative values become additive on the log scale

% Exp(A|1) = 1 e^(-1A)
% we want the log prior; log(1 e^(-1A)) simplifies to -A
logPrior = sum(-parameter);

% Again, multiplication becomes addition when on the log scale
logPosterior = logLik + logPrior;

end

