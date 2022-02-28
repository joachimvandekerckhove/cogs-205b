% Sum of Squared Error
function SSE = sse(obj,A,B,E,beta)   
% Calculate the Sum of Squared Errors between the expected and the observed
% mean RTs, given some parameter values.
    
    % If parameter values aren't specified, we can't compute expectations
    if nargin < 2
        error('MATLAB:SSErequiresParameterValues',['ERROR MESSAGE: ' ...
            'Parameter values for the Power Law model need to be ' ...
            'specified to compute the expected RTs against which we ' ...
            'compare the observed data'])
    end

    %Calculate the SSE
    Observed = obj.ObservedRT;
    Expected = obj.expectedRT(A,B,E,beta);
    Error = Observed-Expected;
    SumSq = Error.^2;
    SSE = sum(SumSq);
    
end