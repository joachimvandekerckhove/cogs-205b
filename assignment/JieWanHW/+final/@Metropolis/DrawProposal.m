function DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.

    %error('Not yet implemented')
    obj.ProposedPointX = [];
    for i = 1:length(obj.CurrentPointX)
        obj.ProposedPointX = [obj.ProposedPointX; normrnd(obj.CurrentPointX(i),obj.TransitionStd)];
    end
            
end