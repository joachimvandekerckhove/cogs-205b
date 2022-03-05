function totalsumll=totalsumloglikelihoods(p,data)
	totalsumll = 0;
	subdata = data.easy;
	subp = [p(1),p(2)];
	totalsumll = totalsumll + final.sumloglikelihoods(subp,subdata);
	subdata = data.medium;
	subp = [p(3),p(4)];
	totalsumll = totalsumll + final.sumloglikelihoods(subp,subdata);
	subdata = data.hard;
	subp = [p(5),p(6)];
	totalsumll = totalsumll + final.sumloglikelihoods(subp,subdata);
end