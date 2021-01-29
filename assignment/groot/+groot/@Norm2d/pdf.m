% Probability density function
function yax = pdf(obj, xax)

% variance_x = 

correlation =  * (1/((obj.).^0.5))
knl = exp( -0.5 * obj.Precision * (obj.Mean - xax).^2);
yax = obj.ScalingConstant * obj.Precision * knl;

end
