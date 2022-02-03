function main()
% -------------------------------------------------------------------------
% main() generates a report file named angela-dateandtime.md that contains
% the mean, covariance, and correlation at the time this function is run. 
% -------------------------------------------------------------------------

% download and read data file from a url into a variable
fileName = angela.getData('http://cidlab.com/files/cogs205b.csv');
data = angela.readData(fileName);

% make a report
angela.report(data);

end
