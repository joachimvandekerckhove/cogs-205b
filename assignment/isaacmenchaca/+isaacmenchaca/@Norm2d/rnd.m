function x = rnd(obj, size)
    if nargin < 2; end  % unused variable 
    
    x = zeros(2, size);
    x(1, :) = obj.Mean(1) * randn(1, size) + obj.sigma1;
    
    x(2, :) = (obj.Mean(2) + obj.sigma2 * obj.Correlation * (((x(1, :) - obj.Mean(1)) / obj.sigma1))) .* randn(1, size) ...
                + obj.sigma2 ^ 2 * sqrt(1 - obj.Correlation ^ 2);
    
end