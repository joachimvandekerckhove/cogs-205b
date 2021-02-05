function mustBeSymm = myFun(obj)
    if obj(2,1) ~= obj(1,2)
        error("Error: off-diagonal elements of Sigma are not equal")
    % error("Error: off-diagonal elements of Sigma are wrong(?)")
    end    
end

