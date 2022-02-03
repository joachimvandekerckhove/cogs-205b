% Check for the log kernel function
function isValidSupport(~, xax)
    if size(xax,1)~=2 || ~all(isreal(xax))
        errorId  = 'Invalid Support';
        errorMsg = 'Support should be a real-valued 2-by-N matrix.';
        throwAsCaller(MException(errorId,errorMsg))
    end
end