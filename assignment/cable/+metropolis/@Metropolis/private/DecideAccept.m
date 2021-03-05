function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

%             error('Not yet implemented')
    if obj.ProposedPointY > obj.CurrentPointY ||...
            obj.LogAcceptanceRatio > rand
        obj.Accept = true;
    else
        obj.Accept = false;
    end
            
end