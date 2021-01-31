% Probability density function
function yax = logpdf(obj, xax)
   
% check shape of input parameter xax
x_size = size(xax);
if (size(x_size) ~= 2)
    error('Function pdf error: Parameter xax shape illegal (should be 2xN)');
end

% If xax is Nx2, restructure 
if (x_size(1) ~= 2)
    if (x_size(2) == 2)
       xax = transpose(xax);
    else
        error('Function pdf error: Parameter xax shape illegal (should be 2xN)');
    end
end

z_element1 = (xax(1,:) - obj.Mean(1))/obj.StandardDev(1);
z_element2 = (xax(2,:) - obj.Mean(2))/obj.StandardDev(2);
z = (z_element1).^2 - (2*obj.Correlation .* z_element1 .* z_element2) + ...
    (z_element2).^2;
subfactor = 1-obj.Correlation^2;
knl = -0.5 * z / subfactor;
scaling = -log(2*pi*obj.StandardDev(1)*obj.StandardDev(2)*sqrt(subfactor));

yax = scaling + knl;

end
