function DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.
    
    if isvector(obj.CurrentPointX) 
        offset = normrnd(0, obj.TransitionStd, [1, obj.XDimensions])';
        obj.ProposedPointX = obj.CurrentPointX + offset;
    end
    
end