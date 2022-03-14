function LogPosterior = ConstrainedLogPosterior(b, data)
	% p: parameters, 4*1 betas, A0,A1,B0,B1

	% parameters calculation:
	p = zeros(6,1);
	p(1) = b(1);
	p(2) = b(3);
	p(3) = b(1) + b(2);
	p(4) = b(3) + b(4);
	p(5) = b(1) + 2 * b(2);
	p(6) = b(3) + 2 * b(4);

	% Log Priors
	LogPrior = 0;
	for i = [1,3]
		LogPrior = LogPrior + log(exppdf(p(i),1));
	end
	for i = [2,4]
		LogPrior = LogPrior - abs(p(i)); %laplace
	end

	% Log Likelihoods
	LogLl = final.totalsumloglikelihoods(p,data);

	% Log Posterior
	LogPosterior = LogLl + LogPrior;
end