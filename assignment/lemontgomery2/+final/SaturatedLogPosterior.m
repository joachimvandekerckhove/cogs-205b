function saturatedLogPosterior = SaturatedLogPosterior(parameter, data)

% Computes the log posterior for the saturated model
logLikelihood = -wbllike(parameter(1:2), data.easy) + ...
                -wbllike(parameter(3:4), data.medium) + ...
                -wbllike(parameter(5:6), data.hard);
logPrior = sum(parameter);
saturatedLogPosterior = logLikelihood * logPrior;

end