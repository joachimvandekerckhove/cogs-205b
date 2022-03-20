function LogPosterior = SaturatedLogPosterior(parameter, data)
% We want to analyze these data usinga two-parameter Weibull 
% distribution W(A, B) with parameters Scale A and Shape B. 
% We want to estimate these two parameters in each condition.

% multiplicative constant becomes an additive constant on the log scale.

    Ae = parameter(1);
    Be = parameter(2);
    Am = parameter(3);
    Bm = parameter(4);
    Ah = parameter(5);
    Bh = parameter(6);

    wLogLikelihoodEasy = -wbllike([Ae, Be],data.easy);
    wLogLikelihoodMedium = -wbllike([Am, Bm],data.medium);
    wLogLikelihoodHard = -wbllike([Ah, Bh],data.hard);
    LogLikelihood = wLogLikelihoodEasy + wLogLikelihoodMedium + wLogLikelihoodHard;
    
    % log(Exp(x | 1)) = log(1 e ^(-1x)) = -x
    LogPrior = sum(-parameter);
    LogPosterior = LogLikelihood + LogPrior;

end

