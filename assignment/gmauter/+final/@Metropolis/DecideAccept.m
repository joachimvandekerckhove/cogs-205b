function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

u = rand;

if obj.LogAcceptanceRatio > log(u)
    obj.AcceptProposal = true;
else%if obj.LogAcceptanceRatio < log(u)
    % This causes trouble! There are cases where this leads to no decision,
    % notably when obj.LogAcceptanceRatio is NaN, which happens! -jv
    obj.AcceptProposal = false;
end
            
end