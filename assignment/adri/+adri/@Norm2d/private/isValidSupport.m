% Check for the log kernel function
function isValidSupport(~, x)
    if size(x,1)~=2 || ~all(isreal(x))
        errorId  = 'Invalid Support';
        errorMsg = 'Support should be a real-valued 2-by-N matrix.';
        throwAsCaller(MException(errorId,errorMsg))
    end
end