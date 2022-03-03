function logposterior = SaturatedLogPosterior(params, data)

scale_e = params(1);
scale_m = params(2);
scale_h = params(3);
shape_e = params(4);
shape_m = params(5);
shape_h = params(6);

data_e = data.easy;
data_m = data.medium;
data_h = data.hard; 

ll_e = -(wbllike([scale_e, shape_e], data_e));
ll_m = -(wbllike([scale_m, shape_m], data_m));
ll_h = -(wbllike([scale_h, shape_h], data_h));

ll = ll_e + ll_m + ll_h; 

lp = -sum(params);

logposterior = ll + lp; 

end