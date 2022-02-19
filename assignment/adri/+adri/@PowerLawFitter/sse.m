% Computing the Sum of Squared Error
function SSE = sse(obj,A,B,E,beta)   
    Observed = obj.ObservedRT;
    Expected = obj.expectedRT(A,B,E,beta);
    error = Observed-Expected;
    SumSq = error.^2;
    SSE = sum(SumSq);
end