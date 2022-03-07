function DrawProposal(obj)

g=normrnd(0, obj.TransitionStd, size(obj.XDimensions));
obj.ProposedPointX=obj.CurrentPointX+g;   

% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.
            
end