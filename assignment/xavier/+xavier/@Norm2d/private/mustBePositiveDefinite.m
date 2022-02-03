% MUSTBEPOSITIVEDEFINITE Check that a matrix is positive definite

function mustBePositiveDefinite(val)

[~, flag] = chol(val);

if flag
    errorId  = 'Norm2d:isPositiveDefinite';
    errorMsg = 'The matrix is not positive definite.';
    throwAsCaller(MException(errorId,errorMsg))
end


end