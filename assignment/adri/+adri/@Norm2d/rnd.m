% Random number generator
function rndm = rnd(obj, dims)            
    %Check that dims =< 1 and that it is a scalar
    if nargin < 2 
        dims = 1;  
    elseif ~isscalar(dims)
        error('Norm2d:tooSmallSize','Dimensions must be a single number')
    end
    %Define some variables to simplify following transformations
    mu1 = obj.Mean(1)
    mu2 = obj.Mean(2)
    sigma1 = sqrt(obj.Covariance(1,1))
    sigma2 = sqrt(obj.Covariance(2,2))
    rho = obj.Correlation;
    
    x1 = sigma1 * randn(1,dims) + mu1
    x2 = (sigma2^2*sqrt(1-rho^2)) * randn(1,dims) + ...
            (mu2+(sigma2*rho)*((x1-mu1)/sigma1));
    rndm = vertcat(x1,x2)
end