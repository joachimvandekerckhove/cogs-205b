function checkNumber(var,varStr)
    if ~isnumeric(var)
        error("Error: %s is not a numeric variable.",varStr);
    end
end