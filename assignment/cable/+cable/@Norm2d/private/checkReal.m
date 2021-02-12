function checkReal(var,varStr)
    % Checks whether any matrix elements are imaginary
    % varStr is a string of the variable's name, for errors
    A = find(~isreal(var));
    if A
        error("Error: Element %i of %s is imaginary.",A(1),varStr);
    end
end
