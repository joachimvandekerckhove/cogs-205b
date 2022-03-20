function totalsumll=totalsumloglikelihoods(p,data)
	totalsumll = 0;
	subdata = data.easy;
	subp = [p(1),p(2)];
	totalsumll = totalsumll -wbllike(subp,subdata);
	subdata = data.medium;
	subp = [p(3),p(4)];
	totalsumll = totalsumll -wbllike(subp,subdata);
	subdata = data.hard;
	subp = [p(5),p(6)];
	totalsumll = totalsumll -wbllike(subp,subdata);
end

% % no need to do the following at all
% function sumll=sumloglikelihoods(subp,subdata)
% 	sumll = 0;
% 	for i=1:length(subdata)
% 		sumll = sumll - wbllike(subp,subdata(i));
% 	end
% end