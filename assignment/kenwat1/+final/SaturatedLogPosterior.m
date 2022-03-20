function SatLogPosterior = SaturatedLogPosterior(params, data)

% params = [Ae Am Ah Be Bm Bh]

Ae = params(1);
Am = params(2);
Ah = params(3);
Be = params(4);
Bm = params(5);
Bh = params(6);

nlogL_easy = -wbllike([Ae Be],data.easy);
nlogL_med = -wbllike([Am Bm],data.medium);
nlogL_hard = -wbllike([Ah Bh],data.hard);

loglikelihood = nlogL_easy + nlogL_med + nlogL_hard;

logprior = -sum(params);

SatLogPosterior = loglikelihood + logprior;

end