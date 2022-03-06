function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

randomNum=rand;
if obj.LogAcceptanceRatio>log(randomNum)
    obj.AcceptProposal=true;
else
    obj.AcceptProposal=false;
end
            error('Not yet implemented')
            
end