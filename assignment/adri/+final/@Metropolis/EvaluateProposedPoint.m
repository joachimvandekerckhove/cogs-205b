% Computes the target function at the proposed point X
% X and stores the result in proposed point Y.
function EvaluateProposedPoint(obj)
    
    obj.ProposedPointY = obj.TargetLogPdf(obj.ProposedPointX);

end