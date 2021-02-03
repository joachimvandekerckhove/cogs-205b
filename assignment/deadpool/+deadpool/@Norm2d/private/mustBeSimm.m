function mustBeSimm(obj)
% Validates if the covariance matrix is positive semi-definite
    if ~(issymmetric(obj))
        eidType = "Covatiance:notsymmetric";
        msgType = 'Covariance matrix is not Simmetryc.';
        throwAsCaller(MException(eidType,msgType));
    end
end