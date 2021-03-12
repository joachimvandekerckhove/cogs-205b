function DecideAccept(obj)

% Sets the "Accept" property to true if the proposed point should be
% accepted, and to false otherwise 

	if (obj.logAcceptRatio > log(rand)) %See JV for additional condition
		obj.Accept = true;
	else
		obj.Accept = false;
            
end
