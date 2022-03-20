function LogPosterior = ConstrainedLogPosterior(parameter, data)

% multiplicative constant becomes an additive constant on the log scale.

    Ae = parameter(1);
    Am = parameter(1) + parameter(2);
    Ah = parameter(1) + 2 * parameter(2);
    
    Be = parameter(3);
    Bm = parameter(3) + parameter(4);
    Bh = parameter(3) + 2 * parameter(4);

    wLogLikelihoodEasy = -wbllike([Ae, Be],data.easy);
    wLogLikelihoodMedium = -wbllike([Am, Bm],data.medium);
    wLogLikelihoodHard = -wbllike([Ah, Bh],data.hard);
    LogLikelihood = wLogLikelihoodEasy + wLogLikelihoodMedium + wLogLikelihoodHard;

    % log(Exp(x | 1)) = log(1 e ^(-1x)) = -x
    % log(Laplace(x | 0, 1)) = -abs(x)
    LogPrior = -parameter(1) - abs(parameter(2)) ...
                 - parameter(3) - abs(parameter(4));

    LogPosterior = LogLikelihood + LogPrior;
end

