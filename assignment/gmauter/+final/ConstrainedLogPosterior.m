function logPosterior = ConstrainedLogPosterior(params, data)

Ae = params(1);
Be = params(3);
Am = params(1) + params(2);
Bm = params(3) + params(4);
Ah = params(1) + 2 * params(2);
Bh = params(3) + 2 * params(4);

logLikeEasy = -wbllike([Ae, Be], data.easy);
logLikeMedm = -wbllike([Am, Bm], data.medium);
logLikeHard = -wbllike([Ah, Bh], data.hard);
logLikelihood = logLikeEasy + logLikeMedm + logLikeHard;

logPrior = -params(1) - abs(params(2)) - params(3) - abs(params(4)); % laplace: -log(2) - abs(params), ignoring constant: -abs(params)

logPosterior = logLikelihood + logPrior;

end

