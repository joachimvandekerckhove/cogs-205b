% Expected Mean Response Times
function ERT = expectedRT(obj,A,B,E,beta)
% Compute the expected mean Response Times for each session ran, given 
% some parameter values
    
    % If parameter values aren't specified, we can't compute expectations
    if nargin < 2
        error('MATLAB:ExpRTrequiresParameterValues',['ERROR MESSAGE: ' ...
            'Parameter values for the Power Law model need to be ' ...
            'specified to compute the expected mean RTs'])
    end
    
    % Compute the expected mean RTs per session.
    N = 1:obj.Count;
    ERT = A + (B*(N+E).^(-beta));   

end