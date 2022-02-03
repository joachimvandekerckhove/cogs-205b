% Customized property validation function for the Covariance matrix
function mustBePosDef(x)
    eigenvalue = eig(x);
    if ~(all(eigenvalue>0))
        eidType = "Covariance Matrix has no inverse";
        msgType = 'Covariance Matrix is not Positive Definite.';
        throwAsCaller(MException(eidType,msgType))
    end
end