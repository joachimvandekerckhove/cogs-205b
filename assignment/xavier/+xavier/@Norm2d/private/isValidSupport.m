% ISVALIDSUPPORT Check that the X values are valid

function isValidSupport(~, xax)

if size(xax,1)~=2 || ~all(isreal(xax))
    errorId  = 'Norm2d:invalidSupport';
    errorMsg = 'Support should be a real-valued 2-by-N matrix.';
    throwAsCaller(MException(errorId,errorMsg))
end

end