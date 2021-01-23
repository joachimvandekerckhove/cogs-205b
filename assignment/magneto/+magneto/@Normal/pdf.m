% Probability density function
function yax = pdf(obj, xax)

knl = exp( -0.5 * obj.Precision * (obj.Mean - xax).^2);
yax = obj.ScalingConstant * obj.Precision * knl;

end
