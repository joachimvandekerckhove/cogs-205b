% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.
function DrawProposal(obj)

% Draw a row vector (size=XDimensions) of Gaussian offsets
    offsets = normrnd(0,obj.TransitionStd,[1, obj.XDimensions]);

% Define candidate vector by adding these offsets to the current values
    obj.ProposedPointX = obj.CurrentPointX + offsets;
            
end