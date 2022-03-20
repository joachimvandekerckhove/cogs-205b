% If AcceptProposal = true, substitute the Current X and Y points with 
% the proposed X and Y points. If AcceptProposal = false, then this method
% is not executed and we keep the current values unchanged.
function MakeProposalCurrent(obj)

    obj.CurrentPointX = obj.ProposedPointX;
    obj.CurrentPointY = obj.ProposedPointY;

end 