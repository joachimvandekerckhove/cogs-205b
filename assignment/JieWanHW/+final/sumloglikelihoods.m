function sumll=sumloglikelihoods(subp,subdata)
	sumll = 0;
	for i=1:length(subdata)
		sumll = sumll + wbllike(subp,subdata(i));
	end
end