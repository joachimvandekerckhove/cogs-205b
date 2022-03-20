function ConsLogPosterior = ConstrainedLogPosterior(params, data)

% params = [betaA0 betaA1 betaB0 betaB1]

Ae = params(1);
Be = params(3);
Am = params(1) + params(2);
Bm = params(3) + params(4);
Ah = params(1) + 2*params(2);
Bh = params(3) + 2*params(4);

nlogL_easy = (-1)*(wbllike([Ae Be],data.easy));
nlogL_med = (-1)*(wbllike([Am Bm],data.medium));
nlogL_hard = (-1)*(wbllike([Ah Bh],data.hard));

loglikelihood = nlogL_easy + nlogL_med + nlogL_hard;
logprior = -(params(1)+abs(params(2)+params(3)+abs(params(4))));

ConsLogPosterior = loglikelihood + logprior;

end