function logPosterior = ConstrainedLogPosterior(parameter,data)
%SATURATEDLOGPOSTERIOR Defines the log posterior for the constrained model
%defined in the Metropolis assignment PDF

% define intercept & slope for parameters
a_intercept = parameter(1);
a_slope = parameter(2);
b_intercept = parameter(3);
b_slope = parameter(4);

% define parameters for the constrained model
a_e = a_intercept;
a_m = a_intercept + a_slope;
a_h = a_intercept + 2*a_slope;
b_e = b_intercept;
b_m = b_intercept + b_slope;
b_h = b_intercept + 2*b_slope;

% get loglikelihood for each condition
logLik_e = -wbllike([a_e, b_e], data.easy);
logLik_m = -wbllike([a_m, b_m], data.medium);
logLik_h = -wbllike([a_h, b_h], data.hard);
logLik = logLik_e + logLik_m + logLik_h; % multiplicative values become additive on the log scale

% Exp(A|1) = 1 e^(-1A)
% we want the log prior; log(1 e^(-1A)) simplifies to -A

% Laplace prior simplifies to -abs(A)
logPrior = sum(-a_intercept) - abs(a_slope) + sum(-b_intercept) - abs(b_slope);

% Again, multiplication becomes addition when on the log scale
logPosterior = logLik + logPrior;
end

