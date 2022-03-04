function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

rng(205);
u = rand(1);

if obj.LogAcceptanceRatio > log(u)
    obj.AcceptProposal = 1;
else
    obj.AcceptProposal = 0;
end
            
end