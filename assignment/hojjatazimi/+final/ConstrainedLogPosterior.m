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

p_x_e = sum(wbllike([ae, be], data.easy ));
p_x_m = sum(wbllike([am, bm], data.medium));
p_x_h = sum(wbllike([ah, bh], data.hard));

p_1 = p_x_e + p_x_m + p_x_h;
p_2 = -(explike([1], b_a_0)) - abs(b_a_1) - (explike([1], b_b_0)) - abs(b_b_1);

log_posterior =  p_2 - p_1;

end

