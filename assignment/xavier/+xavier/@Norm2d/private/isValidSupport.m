% ISVALIDSUPPORT Check that the X values are valid

function isValidSupport(~, xax)

if size(xax,1)~=2 || ~all(isreal(xax))
    error('Norm2d:invalidSupport', ...
        'X should be a real-valued 2-by-N matrix.')
end

end