% Random number generator

function x = rnd(obj, sz)

% Check that a size was given, otherwise default to 1
if nargin < 2
    sz = 1;
elseif ~isscalar(sz)
    % If a size was given, make sure it is scalar
    error('Norm2d:tooSmallSize', 'Size must be a single number')
end

% Sample from two normals
z = randn(2,sz);

% Transform to new mean and covariance
x(1,:) = obj.Mean(1) + sqrt(obj.Covariance(1)) * z(1,:);
x(2,:) = obj.Mean(2) + sqrt(obj.Covariance(4)) * obj.Correlation * z(1,:) ...
    + sqrt(obj.Covariance(4) * ( 1 - obj.Correlation^2)) * z(2,:);

end