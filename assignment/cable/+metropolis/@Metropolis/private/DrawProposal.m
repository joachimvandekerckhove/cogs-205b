function DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.

    obj.ProposedPointX = obj.CurrentPointX + rand(obj.XDim,1) * obj.TransitionStd;
end