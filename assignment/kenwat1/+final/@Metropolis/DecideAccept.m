function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise

u = rand(1);

    if obj.LogAcceptanceRatio > log(u)
        obj.AcceptProposal = true;
    else
        obj.AcceptProposal = false;
    end

end