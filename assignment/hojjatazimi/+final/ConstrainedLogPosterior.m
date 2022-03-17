function log_posterior  = ConstrainedLogPosterior(parameter, data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
b_a_0 = parameter(1);
b_a_1 = parameter(2);
b_b_0 = parameter(3);
b_b_1 = parameter(4);

ae = b_a_0;
am = b_a_0 + b_a_1;
ah = b_a_0 + (2 * b_a_1);
be = b_b_0;
bm = b_b_0 + b_b_1;
bh = b_b_0 + (2* b_b_1);

p_x_e = prod(wblpdf(data.easy, ae, be));
p_x_m = prod(wblpdf(data.medium, am, bm));
p_x_h = prod(wblpdf(data.hard, ah, bh));


p_1 = p_x_e * p_x_m * p_x_h;
p_2 = log(exppdf(b_a_0, 1)) + abs(b_a_1) + log(exppdf(b_b_0)) + abs(b_b_1);

log_posterior = log(p_1) + p_2;

end

