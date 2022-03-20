function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

u = unifrnd(0,1);
log_u = log(u);

if obj.LogAcceptanceRatio > log_u 
    obj.AcceptProposal = true;
else
    obj.AcceptProposal = false;
end
            
end