function yax = logpdf(obj, xax)
   % LOGPDF Log-Probability density function for Norm2d
   
% check shape of input parameter xax
validateattributes(xax,{'numeric'}, {'ndims',2,'nrows',2});


z_element1 = (xax(1,:) - obj.Mean(1))/obj.StandardDev(1);
z_element2 = (xax(2,:) - obj.Mean(2))/obj.StandardDev(2);
z = (z_element1).^2 - (2*obj.Correlation .* z_element1 .* z_element2) + ...
    (z_element2).^2;
subfactor = 1-obj.Correlation^2;
knl = -0.5 * z / subfactor;
scaling = -log(2*pi*obj.StandardDev(1)*obj.StandardDev(2)*sqrt(subfactor));

yax = scaling + knl;

end
