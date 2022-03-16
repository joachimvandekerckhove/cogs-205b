function constrainedLogPosterior = ConstrainedLogPosterior(parameter, data)
  
% Computes the log posterior for the constrained model
easyParameters = [parameter(1) parameter(3)];
mediumParameters = [parameter(1)+parameter(2) parameter(3)+parameter(4)];
hardParameters = [parameter(1)+(2*parameter(2)) parameter(3)+(2*parameter(4))];
logLikelihood = -wbllike(easyParameters, data.easy) + ...
                -wbllike(mediumParameters, data.medium) + ...
                -wbllike(hardParameters, data.hard);
logPrior = - parameter(1) - abs(parameter(2)) - parameter(3) - abs(parameter(4));
constrainedLogPosterior = logLikelihood + logPrior;

end