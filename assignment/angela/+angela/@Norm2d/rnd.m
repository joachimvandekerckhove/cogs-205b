function output7 = rnd(obj, size)

    if nargin < 2, size = 1; end
    
    output7 = mvnrnd(obj.Mean, obj.Covariance, size);
    
    output7 = output7';

end

