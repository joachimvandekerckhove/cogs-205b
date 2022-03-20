function x = rnd(obj, size)

    if nargin < 2, size = 1; end
    
    x = mvnrnd(obj.Mean, obj.Covariance, size);
    
    x = x';

end

