function ert = Expectation(obj)
    ert = zeros(1,obj.Count);
    % also can direct calculate with matrix
    for t = 1:obj.Count
        ert(t) = obj.EstimatedAsymptote + obj.EstimatedRange * (t + obj.EstimatedExposure)^(-obj.EstimatedRate);
    end
end