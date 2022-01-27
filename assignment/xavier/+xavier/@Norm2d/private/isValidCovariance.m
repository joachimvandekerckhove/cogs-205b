% ISVALID2X2COVARIANCE Check that the covariance matrix is valid

function isValid2x2Covariance(obj)

mtx = obj.Covariance;

if any(size(mtx)~=2) || ~issymmetric(mtx) || ~all(eig(mtx)>=0)
    error('Norm2d:setCovariance:inValidCovariance', ...
        'The covariance matrix is invalid')
end

end