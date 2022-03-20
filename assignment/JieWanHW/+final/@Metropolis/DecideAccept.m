function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

    rndnum = rand; %uniform(0,1)

    if obj.LogAcceptanceRatio > log(rndnum)
        obj.AcceptProposal = true;
    else
        obj.AcceptProposal = false;
    end
            
end