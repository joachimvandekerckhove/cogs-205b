% Sets the "Accept" property to true if the proposed 
% point should be accepted, and to false otherwise 
function DecideAccept(obj)

    % Draw a random value u from a Uniform(0,1) and take the log
    u = rand(1);
    logU = log(u);    
    % If LogAcceptanceRatio > log(u), the proposed X is accepted    
    if obj.LogAcceptanceRatio > logU
       obj.AcceptProposal = true;
    else
       obj.AcceptProposal = false;
    end
            
end