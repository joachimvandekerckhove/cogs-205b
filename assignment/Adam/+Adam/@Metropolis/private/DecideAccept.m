function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 


if obj.logAcceptanceRatio > rand()
    obj.Accept=ture;
else
    obj.Accept=false;
end
            
end