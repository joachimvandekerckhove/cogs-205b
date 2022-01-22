function yax = logpdf(obj, xax)
    zpdf = z4pdf(obj,xax);
    A = log(2*pi*obj.Std(1)*obj.Std(2)*sqrt(1-obj.Correlation^2));
    B = (2*(1-obj.Correlation^2));
    yax = zpdf.*A./B;
end