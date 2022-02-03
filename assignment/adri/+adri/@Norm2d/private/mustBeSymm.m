% Customized property validation function for the Covariance matrix
function mustBeSymm(a)
    if ~issymmetric(a)
        errID = 'Not symmetric';
        msgText = 'The inserted Covariance matrix is not symmetric';
        throwAsCaller(MException(errID,msgText))
    end
end