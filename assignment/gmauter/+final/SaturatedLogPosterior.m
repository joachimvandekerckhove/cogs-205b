function logPosterior = SaturatedLogPosterior(params, data)

Ae = params(1);
Be = params(2);
Am = params(3);
Bm = params(4);
Ah = params(5);
Bh = params(6);

logLikeEasy = -wbllike([Ae, Be], data.easy);
logLikeMedm = -wbllike([Am, Bm], data.medium);
logLikeHard = -wbllike([Ah, Bh], data.hard);
logLikelihood = logLikeEasy + logLikeMedm + logLikeHard;

logPrior = sum(-params); % log and e in log(e^-params) cancels, leaving -params

logPosterior = logLikelihood + logPrior;

end

