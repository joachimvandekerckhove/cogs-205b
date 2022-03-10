function DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.

    if isvector(obj.CurrentPointX)
        obj.ProposedPointX = normrnd(obj.CurrentPointX, obj.TransitionStd, ...
                                     size(obj.CurrentPointX));
    else
        obj.ProposedPointX = normrnd(obj.CurrentPointX, obj.TransitionStd);
    end
    
end