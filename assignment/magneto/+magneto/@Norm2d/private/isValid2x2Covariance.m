% ISVALID2X2COVARIANCE Check that the covariance matrix is valid

function isValid2x2Covariance(~, val)

if any(size(val)~=2)    
    error('Norm2d:setCovariance:inValidCovarianceWrongSize', ...
        'The covariance matrix is invalid: Wrong size')
end


if ~issymmetric(val)    
    error('Norm2d:setCovariance:inValidCovarianceNotSymmetric', ...
        'The covariance matrix is invalid: Not symmetric')
end


if ~all(eig(val)>0)    
    error('Norm2d:setCovariance:inValidCovariancePosdef', ...
        'The covariance matrix is invalid: Not positive definite')
end


end