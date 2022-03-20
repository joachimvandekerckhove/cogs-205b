function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

%             error('Not yet implemented')

u = rand;

if obj.LogAcceptanceRatio > u
    obj.AcceptProposal = true;
else
    obj.AcceptProposal = false;
end
            
end