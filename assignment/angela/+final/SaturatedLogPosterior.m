function logposterior = SaturatedLogPosterior(params, data)

ll = @(params,data) -(wbllike(params,data));
ll_e = ll([params(1),params(4)],data.easy);
ll_m = ll([params(2),params(5)],data.medium);
ll_h = ll([params(3),params(6)],data.hard);

ll = ll_e + ll_m + ll_h; 

lp = -sum(params);

logposterior = ll + lp; 

end