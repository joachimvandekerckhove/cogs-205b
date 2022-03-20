% Draws a new proposed point by adding a Gaussian offset to the current
% point.  The standard deviation of the offset is given by the
% TransitionStd property.  If the current point is a vector, adds an
% independent Gaussian offset to each dimension.
function DrawProposal(obj)

% Draw a column vector (size=XDimensions) of Gaussian offsets
    offsets = normrnd(0,obj.TransitionStd,[obj.XDimensions,1]);

% Define candidate vector by adding these offsets to the current values
    obj.ProposedPointX = obj.CurrentPointX + offsets;
            
end