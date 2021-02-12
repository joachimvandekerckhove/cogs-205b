function checkInf(var,varStr)
    % Checks whether any matrix elements are infinity
    % varStr is a string of the variable's name, for errors
    A = find(var == Inf);
    if A
        error("Error: Element %i of %s must be finite.",A(1),varStr);
    end
end