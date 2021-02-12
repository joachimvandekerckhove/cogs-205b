function mustBeInvertible(obj)
    % Must be invertible
    if det(obj) == 0
        error("Error: Determinant of sigma is 0; cannot invert.")
    end
end