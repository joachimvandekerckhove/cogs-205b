
function yax = pdf(obj, xax)
    zpdf = z4pdf(obj,xax);
    A = 1/(2*pi*obj.Std(1)*obj.Std(2)*sqrt(1-obj.Correlation^2));
    B = exp(-zpdf./(2*(1-obj.Correlation^2)));
    yax =  A * B;
end

