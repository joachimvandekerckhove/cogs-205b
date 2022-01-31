function main()

% download and read data file from a url into a variable
fileName = angela.getData('http://cidlab.com/files/cogs205b.csv');
data = angela.readData(fileName);

% make a report
angela.report(data);


end
