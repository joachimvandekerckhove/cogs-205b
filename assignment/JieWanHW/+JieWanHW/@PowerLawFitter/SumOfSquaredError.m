function sse = SumOfSquaredError(obj)
    ert = Expectation(obj);
    sse = (obj.ObservedRT-ert).^2;
end