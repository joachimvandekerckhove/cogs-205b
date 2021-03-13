function proposal = DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.

       	obj.ProposedPointX = obj.CurrentPointX + randn(2,obj.TransitionStd);

end
