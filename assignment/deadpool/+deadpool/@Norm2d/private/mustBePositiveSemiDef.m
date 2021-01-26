function mustBePositiveSemiDef(obj)
% Validates if the covariance matrix is positive semi-definite
    if ~(all(eig(obj))>=0)
        eidType = "CovM:hasnoinverse"
        msgType = 'Covariance matrix is not Positive Semidefinite.';
        throwAsCaller(MException(eidType,msgType))
    end
end