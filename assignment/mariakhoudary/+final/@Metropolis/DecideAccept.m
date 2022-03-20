function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

u = rand(1);

if obj.LogAcceptanceRatio > u
    obj.AcceptProposal = 1;
else
    obj.AcceptProposal = 0;
end
            
end