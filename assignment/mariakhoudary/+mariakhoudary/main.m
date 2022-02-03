function main()

% MAIN generates a report file (mariakhoudary-1.md) containing the mean and
% covariance of the bivariate data contained in
% http://cidlab.com/files/cogs205b.csv at the time it was run

mariakhoudary.getData('http://cidlab.com/files/cogs205b.csv');
data = mariakhoudary.readData('downloaded_data.csv');
data = mariakhoudary.checkData(data);
mariakhoudary.report(data);