function SatLogPosterior = SaturatedLogPosterior(params, data)

% params = [Ae Am Ah Be Bm Bh]

Ae = params(1);
Be = params(4);
Am = params(2);
Bm = params(5);
Ah = params(3);
Bh = params(6);

nlogL_easy = (-1)*(wbllike([Ae Be],data.easy));
nlogL_med = (-1)*(wbllike([Am Bm],data.medium));
nlogL_hard = (-1)*(wbllike([Ah Bh],data.hard));

loglikelihood = nlogL_easy + nlogL_med + nlogL_hard;
logprior = -sum(params);

SatLogPosterior = loglikelihood + logprior;

end