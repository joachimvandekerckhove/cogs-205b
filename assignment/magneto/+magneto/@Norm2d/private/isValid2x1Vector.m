% ISVALID2X2COVARIANCE Check that the mean vector is valid

function isValid2x1Vector(~, val)

val

if any(size(val)~=[2 1]) || any(~isfinite(val)) || any(~isreal(val))
    error('Norm2d:setMean:isValid2x1Vector', ...
        'The mean vector is invalid')
end

end