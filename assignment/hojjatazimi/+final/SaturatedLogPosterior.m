function log_posterior = SaturatedLogPosterior(parameter, data)
%SATURATEDLOGPOSTERIOR 
ae = parameter(1);
am = parameter(2);
ah = parameter(3);
be = parameter(4);
bm = parameter(5);
bh = parameter(6);

p_x_e = (wbllike([ae, be], data.easy ));
p_x_m = (wbllike([am, bm], data.medium));
p_x_h = (wbllike([ah, bh], data.hard));

p_1 = p_x_e + p_x_m + p_x_h;
p_2 = explike([1], parameter);

log_posterior =  -p_1 - p_2;
end

