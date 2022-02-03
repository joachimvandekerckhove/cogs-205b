% MUSTBESYMMETRIC Check that a matrix is symmetric

function mustBeSymmetric(val)

if any(val ~= val')
    errorId  = 'Norm2d:isSymmetric';
    errorMsg = 'The matrix is not symmetric.';
    throwAsCaller(MException(errorId,errorMsg))
end


end