function LogPosterior = SaturatedLogPosterior(p, data)
	% p: parameters, 6*1, Ae,Be,Am,Bm,Ah,Bh
	% Log Priors
	LogPrior = 0;
	for i = 1:6
		LogPrior = LogPrior + log(exppdf(p(i),1));
	end

	% Log Likelihoods
	LogLl = final.totalsumloglikelihoods(p,data);

	% Log Posterior
	LogPosterior = LogLl + LogPrior;
end

