function MakeProposalCurrent(obj)
	%Accept the proposed value as current point
	obj.CurrentPointX = obj.ProposedPointX;
	obj.CurrentPointY = obj.ProposedPointY;
end 
