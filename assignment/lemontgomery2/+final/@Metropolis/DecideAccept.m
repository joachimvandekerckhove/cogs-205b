function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

    if obj.LogAcceptanceRatio > log(rand(1))
        obj.AcceptProposal = 1;
    else
        obj.AcceptProposal = 0;
    end
            
end