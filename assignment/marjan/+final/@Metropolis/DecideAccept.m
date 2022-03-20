function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

           %error('Not yet implemented')
I=log(rand(1));
if obj.LogAcceptanceRatio>I
   obj.AcceptProposal= true;
else
   obj.AcceptProposal=false;

end