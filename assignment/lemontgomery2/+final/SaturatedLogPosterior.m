function saturatedLogPosterior = SaturatedLogPosterior(parameter, data)

% Computes the log posterior for the saturated model
logLikelihood = -wbllike([parameter(1) parameter(4)], data.easy) + ...
                -wbllike([parameter(2) parameter(5)], data.medium) + ...
                -wbllike([parameter(3) parameter(6)], data.hard);
logPrior = sum(-parameter);
saturatedLogPosterior = logLikelihood + logPrior;

end