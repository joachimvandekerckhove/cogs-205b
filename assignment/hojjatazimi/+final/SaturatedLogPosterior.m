function log_posterior = SaturatedLogPosterior(parameter, data)
%SATURATEDLOGPOSTERIOR 
ae = parameter(1);
am = parameter(2);
ah = parameter(3);
be = parameter(4);
bm = parameter(5);
bh = parameter(6);

p_x_e = prod(wblpdf(data.easy, ae, be));
p_x_m = prod(wblpdf(data.medium, am, bm));
p_x_h = prod(wblpdf(data.hard, ah, bh));

p_1 = p_x_e * p_x_m * p_x_h;
p_2 = prod(exppdf(parameter, 1));

log_posterior = log(p_1) + log(p_2);
end

