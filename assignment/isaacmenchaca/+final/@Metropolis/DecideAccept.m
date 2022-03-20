function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise  
% Draw a randomly selected u from U(0,1). If log(α) > log(u), set θ(i) ← θc, otherwise set θ(i) ← θ(i−1)
    if obj.LogAcceptanceRatio > log(rand(1))
        obj.AcceptProposal = true;
    else
        obj.AcceptProposal = false;
    end
            
end