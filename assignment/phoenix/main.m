% Given a URL, download data and compute summary statistics assuming data distributed ~ Bivariate Normal
% Input: none
% relies on local functions getData.m, readData.m, report.m

function main()
	URL = 'http://cidlab.com/files/cogs205b.csv';
	local = getData(URL);
	data = readData(local);
	report(data);
end
