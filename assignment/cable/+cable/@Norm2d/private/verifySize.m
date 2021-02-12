function verifySize(dimMat)
    % calling it dimMat since size() is a built-in function
    % Cannot take strings etc
    checkNumber(dimMat,"size");
    % Can't make 3+ dimensions
    if size(dimMat) > 2
        error("Error: Size asks for more than two dimensions.")
    end
    % Must not have infinite values
    checkInf(dimMat,"size");
    % Must not have imaginary values
    checkReal(dimMat,"size");
end
