function DrawProposal(obj)

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.

%             error('Not yet implemented')

obj.ProposedPointX = obj.CurrentPointX + randn(obj.XDimensions,1) * obj.TransitionStd;
% This took me a while to find! -jv

end