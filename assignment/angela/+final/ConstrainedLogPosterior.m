function logposterior = ConstrainedLogPosterior(params, data)

scale_i = params(1);
scale_s = params(2);
shape_i = params(3);
shape_s = params(4);

scale_e = scale_i;
shape_e = shape_i;
scale_m = scale_i + scale_s;
shape_m = shape_i + shape_s;
scale_h = scale_i + 2*scale_s;
shape_h = shape_i + 2*shape_s;

ll = @(params,data) -(wbllike(params,data));
ll_e = ll([scale_e,shape_e],data.easy);
ll_m = ll([scale_m,shape_m],data.medium);
ll_h = ll([scale_h,shape_h],data.hard);

ll = ll_e + ll_m + ll_h; 

lp = -sum(scale_i) + -abs(scale_s) + -sum(shape_i) + -abs(shape_s);

logposterior = ll + lp; 

end