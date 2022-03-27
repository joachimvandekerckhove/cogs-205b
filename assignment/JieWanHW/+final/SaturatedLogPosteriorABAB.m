function LogPosterior = SaturatedLogPosterior(p, data)
	% p: parameters, 6*1, it is actually Ae Be...(Ae,Be,Am,Bm,Ah,Bh)
	% Log Priors
	LogPrior = 0;
	for i = 1:6
		LogPrior = LogPrior + log(exppdf(p(i),1));
	end

	% Log Likelihoods
	% now it is Ae,Be,Am,Bm,Ah,Bh
% 	c(1) = p(1);   
% 	c(2) = p(4);
% 	c(3) = p(2);
% 	c(4) = p(5);
% 	c(5) = p(3);
% 	c(6) = p(6);
% 
% 	LogLl = final.totalsumloglikelihoods(c,data);


	LogLl = final.totalsumloglikelihoods(p,data);



	% Log Posterior
	LogPosterior = LogLl + LogPrior;
end

